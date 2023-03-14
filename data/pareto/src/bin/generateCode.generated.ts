import * as pe from 'pareto-core-exe'

import * as gpareto from "lib-pareto-typescript-project"

import { $ as project } from "../data/project.data"

pe.runProgram(($) => {
    g_pareto.$b.generateProject(($b) => {
        $b({
            project: project,
            mainData: $,
        })
    })
})