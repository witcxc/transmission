cd github/
git clone git@github.com:transmission/transmission.git
cd transmission
git submodule update --init
brew install openssl
brew reinstall openssl
echo 'export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"' >> ~/.zshrc
export OPENSSL_INCLUDE_DIR=/usr/local/opt/openssl@1.1/include
export OPENSSL_ROOT_DIR=/usr/local/opt/openssl@1.1/
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
rm -rf build
mkdir build
cd build
cmake ..
make -j8
sudo mkdir /usr/local/Applications
sudo chown happyleaf /usr/local/Applications
ln -s /usr/local/opt/openssl/lib/libcrypto.1.1.dylib /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib
make install
open /usr/local/Applications
