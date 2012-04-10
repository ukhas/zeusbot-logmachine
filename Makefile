#!/usr/bin/make -f
# -*- makefile -*-

logs := $(wildcard logs/highaltitude.log.*)
highlighted := $(patsubst logs/%,logs_highlighted/%.html,$(logs))

index.html : $(logs) create_index index.template.html
	./create_index $@

logs_highlighted/%.html : logs/% highlight
	./highlight $< $@

all : index.html $(highlighted)

.PHONY : all
.DEFAULT_GOAL := all
