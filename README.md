# Bazel Homebrew Tap
This repository contains a collection of Homebrew (aka, Brew) "formulae" for Bazel

## Installing Bazel

```
$ brew tap bazelbuild/tap
$ brew install bazelbuild/tap/bazel
```

Please note that if an older version of bazel from homebrew-core is already installed, you will need to uninstall that and specifically install the bazelbuild/tap version, with:

```
$ brew uninstall bazel
$ brew install bazelbuild/tap/bazel
```

Since the `brew tap-pin` command
[has been deprecated](https://github.com/Homebrew/brew/pull/5925), you must
always use the fully-scoped formula name `bazelbuild/tap/bazel` when referring
to the "bazel" formula in this tap.
