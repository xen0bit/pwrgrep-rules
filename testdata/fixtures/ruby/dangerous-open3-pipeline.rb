require 'open3'

def pipe_index
  cmds = params[:cmds]
  # ruleid: dangerous-open3-pipeline
  Open3.pipeline(cmds, 'wc')

  other = params['other']
  # ruleid: dangerous-open3-pipeline
  Open3.pipeline_rw(other, 'sort')

  third = cookies[:cmds]
  # ruleid: dangerous-open3-pipeline
  Open3.pipeline_start(third)
end

def pipe_safe
  # ok: dangerous-open3-pipeline
  Open3.popen3('ls')

  stdin, stdout, wait = Open3.popen3('ls', '-l')
  # ok: dangerous-open3-pipeline
  stdout.read

  # ok: dangerous-open3-pipeline
  'pipeline in a string is not a call'
end
