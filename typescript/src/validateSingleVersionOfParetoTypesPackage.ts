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
                version: string
                from: Entry
            }

            type Entry = {
                //name: string
                version: string
                dependents?: [Dependent]
            }

            type Result = [Entry]

            const result: Result = JSON.parse(stdout)
            if (result.length === 1) {
                console.log(`success: there are only dependencies to 1 version of ${referencePackage}`)

            } else {
                console.error(`there are dependecies to multiple versions of ${referencePackage}`)
                result.forEach(($) => {
                    if ($.dependents === undefined) {
                        console.error(`unexpected data: no dependents`)
                        process.exit(1)
                    }
                    console.error($.version)
                    $.dependents.forEach(($) => {

                        function loop ($: Dependent) {
                            if ($.from.dependents === undefined) {
                                console.error(` ${$.name} (${$.version})`)
                            } else {
                                $.from.dependents.forEach(($) => {
                                    loop($)
                                })
                            }
                        }
                        loop($)
                    })
                })

            }
            // if (dependencies.length === 0) {
            //     if (beVerbose) {
            //         console.log("-no dependencies-")
            //     }
            // } else {
            //     const versions: [string, string][] = []

            //     function push(key: string, version: string) {
            //         versions.push([key, version])
            //         /*
            //         every version check is an asynchronous process, so with every result we need to check
            //         if all versions are processed, if so, do the final step
            //          */
            //         if (versions.length === dependencies.length) {
            //             cp.exec(`npm pkg set ${versions.map(($) => `${dependencyType}.${$[0]}="^${$[1]}"`).join(" ")} --prefix ${contextDir}`, (err, stdout, stderr) => {
            //                 /*
            //                 updates the version numbers in the package.json file
            //                 */
            //                 if (beVerbose) {
            //                     versions.forEach(($) => {
            //                         console.log(`${$[0]}:${$[1]}`)
            //                     })
            //                 }
            //                 if (err !== null) {
            //                     console.error(`could not set dependency versions: ${stderr}`);
            //                     process.exit(1);
            //                 }
            //             });

            //         }
            //     }
            //     dependencies.forEach((key) => {
            //         cp.exec(`npm view ${key}@latest version`, (err, stdout, stderr) => {
            //             /*
            //             gets the latest version from the online database
            //             */
            //             if (err !== null) {
            //                 console.error(`could not retrieve latest version: ${stderr}`);
            //                 process.exit(1);
            //             } else {
            //                 push(key, stdout.trimEnd())
            //             }
            //         });
            //     })
            // }
        }
    }
)