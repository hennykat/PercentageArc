# PercentageArc

![Percentage Arc samples](img/percentageArg.png)

### What is it?

Cocoa Touch Framework to create a custom arc (or a sector) representing a percentage.

#### What is customisable?

* Outer colour (background outside arc)
* Inner colour (background between arc and centre)
* Arc positive colour (percentage representation)
* Arc negative colour (arc not included in percentage)
* Arc start (can start at top, right, bottom, or left)
* Arc width ([0, 1] of available space, set to 1 for sector)
* Percentage

#### What is not customisable?

* Arc is always generated clockwise
* Arc is always centred in given frame
* Arc diameter is the same as the smallest frame side

### How to use

Can be used as a local pod.  Download then reference via path in Podfile of project.