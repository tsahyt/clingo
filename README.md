# Clingo: A grounder and solver for logic programs

Clingo is part of the [Potassco](https://potassco.org) project for *Answer Set
Programming* (ASP).  ASP offers a simple and powerful modeling language to
describe combinatorial problems as *logic programs*.  The *clingo* system then
takes such a logic program and computes *answer sets* representing solutions to
the given problem.  To get an idea, check our [Getting
Started](https://potassco.org/doc/start/) page and the [online
version](https://potassco.org/clingo/run/) of clingo.

Please consult the following resources for further information:

  - [**Downloading source and binary releases**](https://github.com/potassco/clingo/releases)
  - [**Installation and software requirements**](INSTALL.md)
  - [Changes between releases](CHANGES.md)
  - [Documentation](https://github.com/potassco/guide/releases)
  - [Potassco clingo page](https://potassco.org/clingo/)

Clingo is distributed under the [MIT License](LICENSE.md).

## External Heuristics

This branch of Clingo implements support for *external heuristics*. The Clingo
side of this extension exposes a C and Python API to implement such heuristics. For a minimal example consider the following

```
    #script (python)
    class Heuristic:
        def decide(self,vsids):
            print("decide")
            return vsids

        def init(self, init):
            pass

    def main(prg):
        prg.set_heuristic(Heuristic())
        prg.ground([("base", [])])
        prg.solve()
    #end.
```

The `set_heuristic` method registers a heuristic with the solver. A heuristic
is any class that implements a `decide` method which takes the VSIDS decision
as an argument. This decision can be reused as a fallback as in the example.
There can only be *one* heuristic at any given time. Using `set_heuristic`
again will overwrite the existing one.

The `decide` method deals with solver literals. The argument it is called with
contains the solver literal describing the VSIDS decision. The return value is
expected to also be a solver literal. Note that returning a solver literal that
is already assigned *will crash the solver*. It is up to the user to make sure
that only free literals are returned.

Note that the same class can also be registered as a *propagator*, giving
access to the normal propagator interface. In this way, the heuristic can set
watches on atoms.
