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
                console.log(`there are no dependencies on ${referencePackage}`);
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
        const rawResult = JSON.parse(stdout);
        if (rawResult.length === 1) {
            if (beVerbose) {
                console.log(`success: all dependencies use the same version of ${referencePackage}: ${rawResult[0].version}`);
            }
        }
        else {
            console.error(`there are dependecies on multiple versions of ${referencePackage}`);
            const result = {};
            rawResult.forEach(($) => {
                if ($.dependents === undefined) {
                    console.error(`unexpected data: no dependents`);
                    process.exit(1);
                }
                if (result[$.version] === undefined) {
                    result[$.version] = {};
                }
                const current = result[$.version];
                $.dependents.forEach(($) => {
                    function loop($) {
                        if ($.from.dependents === undefined) {
                            current[` ${$.name} (${$.spec})`] = null;
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
            /*
            print the overview
            */
            Object.keys(result).forEach(($) => {
                console.error($);
                const entry = result[$];
                Object.keys(entry).forEach(($) => {
                    console.error(` ${$}`);
                });
            });
        }
    }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoidmFsaWRhdGVTaW5nbGVWZXJzaW9uT2ZQYXJldG9UeXBlc1BhY2thZ2UuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi8uLi8uLi90eXBlc2NyaXB0L3NyYy92YWxpZGF0ZVNpbmdsZVZlcnNpb25PZlBhcmV0b1R5cGVzUGFja2FnZS50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztBQUVBLGtEQUFtQztBQUNuQyxxQ0FBbUM7QUFFbkMsTUFBTSxnQkFBZ0IsR0FBRyxtQkFBbUIsQ0FBQTtBQUU1QyxJQUFJLE9BQU8sQ0FBQyxJQUFJLENBQUMsTUFBTSxHQUFHLENBQUMsRUFBRSxDQUFDO0lBQzFCLE9BQU8sQ0FBQyxLQUFLLENBQUMsMERBQTBELENBQUMsQ0FBQTtJQUN6RSxPQUFPLENBQUMsSUFBSSxDQUFDLENBQUMsQ0FBQyxDQUFBO0FBQ25CLENBQUM7QUFFRCxNQUFNLFVBQVUsR0FBRyxPQUFPLENBQUMsSUFBSSxDQUFDLENBQUMsQ0FBQyxDQUFBO0FBRWxDLElBQUksT0FBTyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsS0FBSyxTQUFTLElBQUksT0FBTyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsS0FBSyxTQUFTLEVBQUUsQ0FBQztJQUNqRSxPQUFPLENBQUMsS0FBSyxDQUFDLHVEQUF1RCxDQUFDLENBQUE7SUFDdEUsT0FBTyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsQ0FBQTtBQUNuQixDQUFDO0FBRUQsTUFBTSxTQUFTLEdBQUcsT0FBTyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsS0FBSyxTQUFTLENBQUE7QUFFL0MsTUFBTSxPQUFPLEdBQUcsZUFBZSxnQkFBZ0IsbUJBQW1CLFVBQVUsRUFBRSxDQUFBO0FBQzlFLEVBQUUsQ0FBQyxJQUFJLENBQ0gsT0FBTztBQUNQOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztFQTZCRTtBQUNGLENBQUMsR0FBRyxFQUFFLE1BQU0s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