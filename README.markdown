Description
---

A fixed size LIFO data structure, optionally free of duplicates. They feel a lot like arrays, but differ in some important areas like indexing. This is e.g. useful for keeping a history of recent actions.

Usage
---

Create a new `Revolver`:

    r = Revolver.new(3)
    #=> #<Revolver: []>

Create a `Revolver` with unique elements:

    r = Revolver.new(3, true)
    #=> #<Revolver: []>

Alternatively, you can create a `Revolver` from an existing array:

    Revolver.from_array([*1..3], 3)
    #=> #<Revolver: [1, 2, 3]>

Or from a list of elements:

    Revolver[*1..3]
    #=> #<Revolver: [1, 2, 3]>

You can also create a unique `Revolver` that way:

    Revolver.from_array([1, 1, 3], true)
    #=> #<Revolver: [1, 3]>

Add elements:

    r = Revolver.new(3).push(1).push(2).push(3)
    #=> #<Revolver: [1, 2, 3]>
    r.push(4)
    #=> #<Revolver: [2, 3, 4]>
    r << 5 << 6
    #=> #<Revolver: [4, 5, 6]>

Remove an element from the end:

    r.pop
    #=> 6

Check a `Revolver`'s size:

    r.size
    #=> 2

A `Revolver` can be indexed like an array:

    r = Revolver.from_array([*1..5])
    #=> #<Revolver: [1, 2, 3, 4, 5]>
    r[4]
    #=> 5

However, indices wrap around:

    r[10]
    #=> 1

This also works for negative indices:

    r[-1]
    #=> 5
    r[-6]
    #=> 1
    r[-8]
    #=> 3

Finally you can get a plain array out of a `Revolver`:

    r.to_a
    #=> [1, 2, 3, 4, 5]

Thanks
---
* [Wojtek Mach](https://github.com/wojtekmach) for [adding](https://github.com/citizen428/revolver/pull/1) `Revolver.[]`.

License
---

Copyright (c) 2012 Michael Kohl

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
