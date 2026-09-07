package fixture

import (
	"archive/zip"
	"io"
	"path/filepath"
)

func vulnExtract(archive string, target string) error {
	// ruleid: path-traversal-inside-zip-extraction
	reader, err := zip.OpenReader(archive)
	if err != nil {
		return err
	}
	for _, f := range reader.File {
		path := filepath.Join(target, f.Name)
		_ = path
	}
	return nil
}

func vulnExtractWrite(archive string, target string) error {
	// ruleid: path-traversal-inside-zip-extraction
	reader, err := zip.OpenReader(archive)
	if err != nil {
		return err
	}
	for _, f := range reader.File {
		path := filepath.Join(target, f.Name)
		_ = path
		_ = f
	}
	return nil
}

func vulnExtractCopy(archive string, target string, w io.Writer) error {
	// ruleid: path-traversal-inside-zip-extraction
	reader, err := zip.OpenReader(archive)
	if err != nil {
		return err
	}
	for _, f := range reader.File {
		path := filepath.Join(target, f.Name)
		_, _ = io.WriteString(w, path)
	}
	return nil
}

func safeListOnly(archive string) ([]string, error) {
	reader, err := zip.OpenReader(archive)
	if err != nil {
		return nil, err
	}
	// ok: path-traversal-inside-zip-extraction
	var names []string
	for _, f := range reader.File {
		names = append(names, f.Name)
	}
	return names, nil
}

func safeNoZip(target string, name string) string {
	// ok: path-traversal-inside-zip-extraction
	return filepath.Join(target, name)
}

func safeMention() string {
	// ok: path-traversal-inside-zip-extraction
	return "OpenReader in a comment is not a call"
}
