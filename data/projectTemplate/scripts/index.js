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
if (process.argv.length < 4) {
    console.error("usage: 'directory containing the package.json' dependencies|devDependencies [verbose]");
    process.exit(1);
}
const contextDir = process.argv[2];
const dependencyType = process.argv[3];
if (dependencyType !== "dependencies" && dependencyType !== "devDependencies") {
    console.error("for the 2nd parameter choose either 'dependencies' or 'devDependencies'");
    process.exit(1);
}
if (process.argv[4] !== undefined && process.argv[4] !== "verbose") {
    console.error("3rd parameter should be omitted or the word 'verbose'");
    process.exit(1);
}
const beVerbose = process.argv[4] !== undefined;
const command = `npm pkg get "${dependencyType}" --prefix ${contextDir}`;
cp.exec(command, 
/*
should return something like this:

{
    "@types/node": "^22.4.0",
    "typescript": "^5.5.4"
}

*/
(err, stdout, stderr) => {
    if (err !== null) {
        console.error(`${stderr}`);
        process.exit(1);
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
        /* we have a valid JSON */
        const dependencies = Object.keys(JSON.parse(stdout));
        if (dependencies.length === 0) {
            if (beVerbose) {
                console.log("-no dependencies-");
            }
        }
        else {
            const versions = [];
            function push(key, version) {
                versions.push([key, version]);
                /*
                every version check is an asynchronous process, so with every result we need to check
                if all versions are processed, if so, do the final step
                 */
                if (versions.length === dependencies.length) {
                    cp.exec(`npm pkg set ${versions.map(($) => `${dependencyType}.${$[0]}="^${$[1]}"`).join(" ")} --prefix ${contextDir}`, (err, stdout, stderr) => {
                        /*
                        updates the version numbers in the package.json file
                        */
                        if (beVerbose) {
                            versions.forEach(($) => {
                                console.log(`${$[0]}:${$[1]}`);
                            });
                        }
                        if (err !== null) {
                            console.error(`could not set dependency versions: ${stderr}`);
                            process.exit(1);
                        }
                    });
                }
            }
            dependencies.forEach((key) => {
                cp.exec(`npm view ${key}@latest version`, (err, stdout, stderr) => {
                    /*
                    gets the latest version from the online database
                    */
                    if (err !== null) {
                        console.error(`could not retrieve latest version: ${stderr}`);
                        process.exit(1);
                    }
                    else {
                        push(key, stdout.trimEnd());
                    }
                });
            });
        }
    }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiaW5kZXguanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi8uLi90eXBlc2NyaXB0L3NyYy9pbmRleC50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztBQUVBLGtEQUFtQztBQUNuQyxxQ0FBbUM7QUFFbkMsSUFBSSxPQUFPLENBQUMsSUFBSSxDQUFDLE1BQU0sR0FBRyxDQUFDLEVBQUUsQ0FBQztJQUMxQixPQUFPLENBQUMsS0FBSyxDQUFDLHVGQUF1RixDQUFDLENBQUE7SUFDdEcsT0FBTyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsQ0FBQTtBQUNuQixDQUFDO0FBRUQsTUFBTSxVQUFVLEdBQUcsT0FBTyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsQ0FBQTtBQUNsQyxNQUFNLGNBQWMsR0FBRyxPQUFPLENBQUMsSUFBSSxDQUFDLENBQUMsQ0FBQyxDQUFBO0FBRXRDLElBQUksY0FBYyxLQUFLLGNBQWMsSUFBSSxjQUFjLEtBQUssaUJBQWlCLEVBQUcsQ0FBQztJQUM3RSxPQUFPLENBQUMsS0FBSyxDQUFDLHlFQUF5RSxDQUFDLENBQUE7SUFDeEYsT0FBTyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsQ0FBQTtBQUNuQixDQUFDO0FBRUQsSUFBSSxPQUFPLENBQUMsSUFBSSxDQUFDLENBQUMsQ0FBQyxLQUFLLFNBQVMsSUFBSSxPQUFPLENBQUMsSUFBSSxDQUFDLENBQUMsQ0FBQyxLQUFLLFNBQVMsRUFBRyxDQUFDO0lBQ2xFLE9BQU8sQ0FBQyxLQUFLLENBQUMsdURBQXVELENBQUMsQ0FBQTtJQUN0RSxPQUFPLENBQUMsSUFBSSxDQUFDLENBQUMsQ0FBQyxDQUFBO0FBQ25CLENBQUM7QUFFRCxNQUFNLFNBQVMsR0FBRyxPQUFPLENBQUMsSUFBSSxDQUFDLENBQUMsQ0FBQyxLQUFLLFNBQVMsQ0FBQTtBQUUvQyxNQUFNLE9BQU8sR0FBRyxnQkFBZ0IsY0FBYyxjQUFjLFVBQVUsRUFBRSxDQUFB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