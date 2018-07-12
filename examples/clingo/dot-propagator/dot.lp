#script (python)

def main(prg):
    prg.set_heuristic()
    prg.ground([("base", [])])
    prg.solve()
    sys.stdout.write("\n")

#end.
