pushd note-link-janitor
yarn install --ignore-engines
yarn build
popd

pushd notes-monthly-summariser
swift build -c release
popd