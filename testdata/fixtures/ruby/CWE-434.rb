# CWE-434: params[:file] -> File.open without allowlist
class UploadController < ApplicationController
  def vuln1
    f = params[:file]
    # ruleid: ruby-434-upload
    File.open("/uploads/" + f.original_filename, "wb") { |io| io.write(f.read) }
  end

  def vuln2
    name = params[:file].original_filename
    # ruleid: ruby-434-upload
    File.write("/tmp/" + name, params[:file].read)
  end

  def vuln3
    uploaded = params["file"]
    # ruleid: ruby-434-upload
    IO.write("/uploads/" + uploaded[:filename], uploaded.read)
  end

  def safe_allowlist
    f = params[:file]
    ext = File.extname(f.original_filename)
    if ![".png", ".jpg"].include?(ext)
      raise "bad"
    end
    # ok: ruby-434-upload
    File.open("/uploads/allowed.png", "wb") { |io| io.write(f.read) }
  end

  def safe_fixed
    # ok: ruby-434-upload
    File.open("/tmp/fixed.png", "wb") { |io| io.write("fixed") }
  end
end
