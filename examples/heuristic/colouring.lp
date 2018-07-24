#script (python)

import colouring

def main(prg):
    prg.set_heuristic(colouring.ColouringHeuristic())
    prg.ground([("base", [])])
    ret = prg.solve()
    print(ret)

#end.
