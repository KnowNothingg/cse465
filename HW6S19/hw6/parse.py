import sys


test1 = "the sun shines"
test2 = "the yellow sun shines"
test3 = "sun shines"
test4 = "a yellow big sun shines"
test5 = "the yellow big suns shine"

singular_noun = ["sun", "bus", "deer"]
plural_noun = ["suns", "buses", "deer"]

article = ["a", "an", "the"]
adverbs = ["loudly", "brightly"]
adjectives = ["yellow", "big", "brown"]

plural_verb = ["shine", "run", "eat"]
singular_verb = ["shines", "run", "eats"]

# while True:
    # line = sys.stdin.readline() 
    # if len(line) == 0: break
    line = test1.split(" ")
    print(line[0])