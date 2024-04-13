import sys
import os

with open(sys.argv[1], "r") as f:  # generate that file using fdupes
    lines = f.readlines()

for i in range(len(lines) // 3):
    first = lines[3 * i].strip("\n")
    second = lines[3 * i + 1].strip("\n")

    # Really this should be a DSL.

    if "From phone" in first and not ("From phone" in second):
        os.unlink(first)
    elif "From phone" in second:
        os.unlink(second)

    elif "To Sort" in first and not ("To Sort" in second):
        os.unlink(first)
    elif "To Sort" in second:
        os.unlink(second)

    elif "Emerson Curated/Like" in first or "Emerson Curated/Love" in first or "Emerson Curated/Passion" in first:
        os.unlink(second)
    elif "Emerson Curated/Like" in second or "Emerson Curated/Love" in second or "Emerson Curated/Passion" in second:
        os.unlink(first)

    elif "Emerson/Lighter" in first or "Emerson/Darker" in first:
        os.unlink(second)
    elif "Emerson/Lighter" in second or "Emerson/Darker" in second:
        os.unlink(first)

    elif "Emerson Curated/Assorted" in first and "Emerson Curated" in second and not "Emerson Curated/Assorted" in second:
        os.unlink(second)
    elif "Emerson Curated/Assorted" in second and "Emerson Curated" in first and not "Emerson Curated/Assorted" in first:
        os.unlink(first)

    elif "Adventures/Etc" in first and "Adventures" in second and not "Adventures/Etc" in second:
        os.unlink(second)
    elif "Adventures/Etc" in second and "Adventures" in first and not "Adventures/Etc" in first:
        os.unlink(first)

    elif "Lindsay" in first and "Linus" in second:
        os.unlink(first)
    elif "Lindsay" in second and "Linus" in first:
        os.unlink(second)

    elif "St_Helens" in first and "mt-hood" in second:
        os.unlink(second)
    elif "St_Helens" in second and "mt-hood" in first:
        os.unlink(first)

    elif "People/Oliners" in first and "Etc" in second:
        os.unlink(second)
    elif "People/Oliners" in second and "Etc" in first:
        os.unlink(first)

    else:
        print(first)
        print(second)
        print()
