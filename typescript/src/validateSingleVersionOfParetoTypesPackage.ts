#!/usr/bin/env node

import * as cp from "child_process"
import { argv, cwd } from "process"

const referencePackage = "pareto-core-types"

if (process.argv.length < 3) {
    console.error("usage: 'directory containing the package.json' [verbose]")
    process.exit(1)
}

const contextDir = process.argv[2]

if (process.argv[3] !== undefined && process.argv[3] !== "verbose") {
    console.error("2nd parameter should be omitted or the word 'verbose'")
    process.exit(1)
}

const beVerbose = process.argv[3] !== undefined

const command = `npm explain ${referencePackage} -json --prefix ${contextDir}`
cp.exec(
    command,
    /*
    should return something like this:
[
  {
    "name": "undici-types",
    "version": "6.19.8",
    ...
    "dependents": [
      {
        ...
        "from": {
          "name": "@types/node",
          "version": "22.5.2",
          ...
          "dependents": [
            {
              "type": "dev",
              "name": "@types/node",
              "spec": "^22.5.2",
              ...
            }
          ]
        }
      }
    ],
    ...
  }
]

    */
    (err, stdout, stderr) => {
        if (err !== null) {
            if (stderr.indexOf("No dependencies found") !== -1) {
                //nothing to do
                if (beVerbose) {
                    console.log(`there are not dependencies on ${referencePackage}`)
                }
            } else {
                console.error(`${stderr}`)
                process.exit(1)
            }
        } else {
            try {
                JSON.parse(stdout)
            } catch (e) {
                console.error(`error while executing ${argv[1]}`)
                console.error(`working directory: ${cwd()}`)
                console.error(`the command that was run: \`${command}\``)
                console.error(`the output of the command is not valid JSON: '${stdout}'`)
                process.exit(1)
            }
            /* we have a valid JSON */

            type Dependent = {
                name: string
                spec: string
                from: Entry
            }

            type Entry = {
                //name: string
                version: string
                dependents?: [Dependent]
            }

            type RawResult = [Entry]

            /**
             * the outer key is the version of the reference package
             * the inner key is the combination of name and version of the dependent package
             */
            type Result = { [key: string]: { [key: string]: null } }

            const rawResult: RawResult = JSON.parse(stdout)
            if (rawResult.length === 1) {
                if (beVerbose) {
                    console.log(`success: all dependencies use the same version of ${referencePackage}`)
                }

            } else {
                console.error(`there are dependecies on multiple versions of ${referencePackage}`)

                const result: Result = {}
                rawResult.forEach(($) => {
                    if ($.dependents === undefined) {
                        console.error(`unexpected data: no dependents`)
                        process.exit(1)
                    }
                    if (result[$.version] === undefined) {
                        result[$.version] = {}
                    }
                    const current = result[$.version]
                    $.dependents.forEach(($) => {

                        function loop($: Dependent) {
                            if ($.from.dependents === undefined) {
                                current[` ${$.name} (${$.spec})`] = null
                            } else {
                                $.from.dependents.forEach(($) => {
                                    loop($)
                                })
                            }
                        }
                        loop($)
                    })
                })
                Object.keys(result).forEach(($) => {
                    console.error($)
                    const entry = result[$]
                    Object.keys(entry).forEach(($) => {
                        console.error(` $`)
                    })

                })

            }
        }
    }
)