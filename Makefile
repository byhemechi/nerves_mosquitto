build:
	cd deps/mosquitto && make WITH_STATIC_LIBRARIES=yes WITH_SHARED_LIBRARIES=no WITH_DOCS=no binary

copy:
	mkdir -p priv/binaries && \
	cp deps/mosquitto/src/mosquitto priv/binaries

clean:
	(cd deps/mosquitto && make clean)
	rm -r priv/binaries
