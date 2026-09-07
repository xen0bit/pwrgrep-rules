# snapshot.assert_match writes through pathlib: patching pathlib.Path
# in the same file makes the snapshot land elsewhere. Flag the pair;
# plain asserts (even with the patch) are fine.
import pytest


def test_patched(mocker):
    mocker.patch("pathlib.Path", return_value="/tmp/x")
    # ruleid: pytest-assert_match-after-path-patch
    snapshot.assert_match("hello")


def test_patched_object(mocker):
    mocker.patch.object(pathlib.Path, "exists", return_value=True)
    # ruleid: pytest-assert_match-after-path-patch
    snapshot.assert_match("world")


def test_patched_again(mocker):
    mocker.patch("pathlib.Path", return_value="/tmp/y")
    # ruleid: pytest-assert_match-after-path-patch
    snapshot.assert_match("again")


def test_plain(mocker):
    mocker.patch("pathlib.Path", return_value="/tmp/x")
    # ok: pytest-assert_match-after-path-patch
    assert True


def test_equal(mocker):
    mocker.patch("pathlib.Path", return_value="/tmp/x")
    # ok: pytest-assert_match-after-path-patch
    assert compute() == 1


def test_none(mocker):
    mocker.patch("pathlib.Path", return_value="/tmp/x")
    # ok: pytest-assert_match-after-path-patch
    assert compute() is not None
