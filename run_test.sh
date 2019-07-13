#!/bin/bash

dockerson run --rm -u $(id -u):$(id -g) -v "$PWD":/app -w /app gradle:5.5 gradle test
