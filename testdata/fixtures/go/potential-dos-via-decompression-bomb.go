package fixture

import (
	"compress/gzip"
	"io"
)

func vulnGzip(r io.Reader, w io.Writer) error {
	gr, err := gzip.NewReader(r)
	if err != nil {
		return err
	}
	// ruleid: potential-dos-via-decompression-bomb
	_, err = io.Copy(w, gr)
	return err
}

func vulnGzipAgain(r io.Reader, w io.Writer) error {
	gr, err := gzip.NewReader(r)
	if err != nil {
		return err
	}
	// ruleid: potential-dos-via-decompression-bomb
	_, err = io.Copy(w, gr)
	return err
}

func vulnCopyBuffer(r io.Reader, w io.Writer) error {
	gr, err := gzip.NewReader(r)
	if err != nil {
		return err
	}
	// ruleid: potential-dos-via-decompression-bomb
	_, err = io.CopyBuffer(w, gr, make([]byte, 4096))
	return err
}

func safeNoCopy(r io.Reader) error {
	// ok: potential-dos-via-decompression-bomb
	gr, err := gzip.NewReader(r)
	if err != nil {
		return err
	}
	_ = gr
	return nil
}

func safeReadAll(r io.Reader) ([]byte, error) {
	// ok: potential-dos-via-decompression-bomb
	return io.ReadAll(r)
}

func safeWrite(w io.Writer, data []byte) (int, error) {
	// ok: potential-dos-via-decompression-bomb
	return w.Write(data)
}
