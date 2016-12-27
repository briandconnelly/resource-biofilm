# Avida Configuration Files

* [analyze.cfg](analyze.cfg) - "Analyze mode" configuration that saves information about all of the phenotypes in the population
* [avida.cfg](avida.cfg) - Main Avida configuration file
* [default-heads.org](default-heads.org) - Ancestral organism capable only of reproduction
* [environment-022.cfg](environment-022.cfg) - Sample environment configuration for an environment with an equilibrium resource level of 22.
* [events-10-40-10.cfg](events-10-40-10.cfg) - Events file where equilibrium resource levels change from 10 to 40 and back to 10 (see Figure 4)
* [events-40-10-40.cfg](events-40-10-40.cfg) - Events file where equilibrium resource levels change from 40 to 10 and back to 40 (see Figure 4)
* [events.cfg](events.cfg) - Events file used for most simulations
* [instset-heads.cfg](instset-heads.cfg) - Set of instructions available to organisms

Using these files, a simulation can be run for 100,000 updates in an environment with an equilibrium resource level of 22 by running the following command:

```sh
avida -c avida.cfg -set ENVIRONMENT_FILE environment-022.cfg -set EVENT_FILE events.cfg
```

Afterwards, use analyze mode to obtain information about the phenotypes present during the simluation:

```sh
avida -a -c avida.cfg -set ENVIRONMENT_FILE environment-022.cfg -set EVENT_FILE events.cfg -set ANALYZE_FILE analyze.cfg
```
