import os

inc_directory = os.fsencode("./inc")
include_directory = os.fsencode("./include")
function_types = ["int", "double", "long", "void"]
function_names = []
inc_file_names = []
function_counter = 0


def browse_files(directory):
    for file in os.listdir(directory):
        filename = os.fsdecode(file)
        inc_file_names.append(filename)
        function_names.append(parse_file("./inc/" + filename))


def parse_file(filename):
    result = []

    with open(filename, "r") as file:
        lines = file.readlines()

    for line in lines:
        split_line = line.split()
        if len(split_line) >= 2 and split_line[0] in function_types:
            if split_line[1][0] == "A":
                result.append(split_line[1][:-1])

    return result


def create_script(script_name):
    i = 0

    with open(script_name, "w") as file:
        write_intro(file)

        file.write("\nfuns='['\n")

        for header in function_names:
            file.write("\n#----" + inc_file_names[i] + "\n")

            for fun in header:
                file.write("funs+='\"_" + fun + "\",' \n")

            i += 1

        file.write("\nfuns+=']'\n")
        write_outro(file)


def write_intro(file):
    file.write("#!/usr/bin/bash\n\n" + \
               "emcc=\"/home/osboxes/emsdk/emscripten/1.37.36/./emcc\"\n" +
               "emmake=\"/home/osboxes/emsdk/emscripten/1.37.36/./emmake\"\n" +
               "emconf=\"/home/osboxes/emsdk/emscripten/1.37.36/." +
               "/emconfigure\"\n" +
               "emcmake=\"/home/osboxes/emsdk/emscripten/1.37.36/./emcmake\"" +
               "\n" +
               "emrun=\"/home/osboxes/emsdk/emscripten/1.37.36/./emrun\"\n\n" +
               "mkdir _build\n" +
               "cd _build\n" +
               "\"$emcmake\" cmake ..\n" +
               "\"$emmake\" make\n")


def write_outro(file):
    file.write(
        "\n\"$emcc\" libat.a -o libat.js -s EXPORTED_FUNCTIONS=\"$funs\" \\\n" +
        "-s EXTRA_EXPORTED_RUNTIME_METHODS='[\"ccall\", \"cwrap\"]'\n\n" +
        "rm ../libat.js\n" +
        "rm ../libat.a\n" +
        "mv libat.a ..\n" +
        "mv libat.js ..\n")


def print_missing_files(directory):
    print("Files not parsed: ")

    for file in os.listdir(directory):
        filename = os.fsdecode(file)

        if filename not in inc_file_names:
            print(filename)


def main():
    browse_files(inc_directory)
    create_script("run.sh")
    print_missing_files(include_directory)


if __name__ == "__main__":
    main()
