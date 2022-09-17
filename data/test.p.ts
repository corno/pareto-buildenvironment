#!/usr/bin/env node

import * as pe from "pareto-core-exe"

import * as test from "lib-pareto-test"

import { createGetTestset } from "../implementation"
import { dependencies } from "../dependencies/dependencies.p"


pe.runProgram(
    test.createTester(
        null,
        {
            getTestSet: createGetTestset(
                dependencies
            ),
            dependencies: test.dependencies,
        },
    )
)
