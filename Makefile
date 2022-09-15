CXX = clang++
CXXFLAGS = -O2 -std=c++17 -Wall -Wextra -pthread

PREFIX = /usr/local

OPENSSL_DIR = $(PREFIX)/opt/openssl@1.1
OPENSSL_SUPPORT = -DCPPHTTPLIB_OPENSSL_SUPPORT -I$(OPENSSL_DIR)/include -L$(OPENSSL_DIR)/lib -lssl -lcrypto

ZLIB_SUPPORT = -DCPPHTTPLIB_ZLIB_SUPPORT -lz

BROTLI_DIR = $(PREFIX)/opt/brotli
BROTLI_SUPPORT = -DCPPHTTPLIB_BROTLI_SUPPORT -I$(BROTLI_DIR)/include -L$(BROTLI_DIR)/lib -lbrotlicommon -lbrotlienc -lbrotlidec
ASIO_DIR = /home/lighthouse/src/asio/asio
ASIO_SUPPORT = -DASIO_STANDALONE -I$(ASIO_DIR)/include 
all: t1 t2

timer1 : timer1.cpp
	$(CXX) -o timer1.out $(CXXFLAGS) timer1.cpp $(ASIO_SUPPORT)
t1 : timer1
	./timer1.out

timer2 : timer2.cpp
	$(CXX) -o timer2.out $(CXXFLAGS) timer2.cpp $(ASIO_SUPPORT)
t2 : timer2
	./timer2.out

# client : client.cc ../httplib.h Makefile
# 	$(CXX) -o client $(CXXFLAGS) client.cc $(OPENSSL_SUPPORT) $(ZLIB_SUPPORT) $(BROTLI_SUPPORT)
