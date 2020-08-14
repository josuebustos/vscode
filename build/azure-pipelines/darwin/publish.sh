#!/usr/bin/env bash
set -e

# publish the build
node build/azure-pipelines/common/createAsset.js \
	darwin \
	archive \
	"VSCode-darwin-$VSCODE_QUALITY-$VSCODE_ARCH.zip" \
	../VSCode-darwin-$VSCODE_ARCH.zip

# package Remote Extension Host
pushd .. && mv vscode-reh-darwin vscode-server-darwin \
	&& zip -Xry vscode-server-darwin vscode-server-darwin && popd

# publish Remote Extension Host
node build/azure-pipelines/common/createAsset.js \
	server-darwin \
	archive-unsigned \
	"vscode-server-darwin.zip" \
	../vscode-server-darwin.zip
