#!/usr/bin/env node
"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
const cp = __importStar(require("child_process"));
const process_1 = require("process");
const referencePackage = "pareto-core-types";
if (process.argv.length < 3) {
    console.error("usage: 'directory containing the package.json' [verbose]");
    process.exit(1);
}
const contextDir = process.argv[2];
if (process.argv[3] !== undefined && process.argv[3] !== "verbose") {
    console.error("2nd parameter should be omitted or the word 'verbose'");
    process.exit(1);
}
const beVerbose = process.argv[3] !== undefined;
const command = `npm explain ${referencePackage} -json --prefix ${contextDir}`;
cp.exec(command, 
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
                console.log(`there are not dependencies on ${referencePackage}`);
            }
        }
        else {
            console.error(`${stderr}`);
            process.exit(1);
        }
    }
    else {
        try {
            JSON.parse(stdout);
        }
        catch (e) {
            console.error(`error while executing ${process_1.argv[1]}`);
            console.error(`working directory: ${(0, process_1.cwd)()}`);
            console.error(`the command that was run: \`${command}\``);
            console.error(`the output of the command is not valid JSON: '${stdout}'`);
            process.exit(1);
        }
        const result = JSON.parse(stdout);
        if (result.length === 1) {
            console.log(`success: there are only dependencies to 1 version of ${referencePackage}`);
        }
        else {
            console.error(`there are dependecies to multiple versions of ${referencePackage}`);
            result.forEach(($) => {
                if ($.dependents === undefined) {
                    console.error(`unexpected data: no dependents`);
                    process.exit(1);
                }
                console.error($.version);
                $.dependents.forEach(($) => {
                    function loop($) {
                        if ($.from.dependents === undefined) {
                            console.error(` ${$.name}`);
                        }
                        else {
                            $.from.dependents.forEach(($) => {
                                loop($);
                            });
                        }
                    }
                    loop($);
                });
            });
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
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoidmFsaWRhdGVTaW5nbGVWZXJzaW9uT2ZQYXJldG9UeXBlc1BhY2thZ2UuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi8uLi90eXBlc2NyaXB0L3NyYy92YWxpZGF0ZVNpbmdsZVZlcnNpb25PZlBhcmV0b1R5cGVzUGFja2FnZS50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztBQUVBLGtEQUFtQztBQUNuQyxxQ0FBbUM7QUFFbkMsTUFBTSxnQkFBZ0IsR0FBRyxtQkFBbUIsQ0FBQTtBQUU1QyxJQUFJLE9BQU8sQ0FBQyxJQUFJLENBQUMsTUFBTSxHQUFHLENBQUMsRUFBRSxDQUFDO0lBQzFCLE9BQU8sQ0FBQyxLQUFLLENBQUMsMERBQTBELENBQUMsQ0FBQTtJQUN6RSxPQUFPLENBQUMsSUFBSSxDQUFDLENBQUMsQ0FBQyxDQUFBO0FBQ25CLENBQUM7QUFFRCxNQUFNLFVBQVUsR0FBRyxPQUFPLENBQUMsSUFBSSxDQUFDLENBQUMsQ0FBQyxDQUFBO0FBRWxDLElBQUksT0FBTyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsS0FBSyxTQUFTLElBQUksT0FBTyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsS0FBSyxTQUFTLEVBQUUsQ0FBQztJQUNqRSxPQUFPLENBQUMsS0FBSyxDQUFDLHVEQUF1RCxDQUFDLENBQUE7SUFDdEUsT0FBTyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsQ0FBQTtBQUNuQixDQUFDO0FBRUQsTUFBTSxTQUFTLEdBQUcsT0FBTyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsS0FBSyxTQUFTLENBQUE7QUFFL0MsTUFBTSxPQUFPLEdBQUcsZUFBZSxnQkFBZ0IsbUJBQW1CLFVBQVUsRUFBRSxDQUFBO0FBQzlFLEVBQUUsQ0FBQyxJQUFJLENBQ0gsT0FBTztBQUNQOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztFQTZCRTtBQUNGLENBQUMsR0FBRyxFQUFFLE1BQU0sRUFB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