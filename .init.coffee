#!/usr/bin/env coffee

import fs from "fs"
import path from "path"

walk = (dir)->
  for await d from await fs.promises.opendir(dir)
    {name} = d
    entry = path.join(dir, name)
    if d.isDirectory()
      if ['node_modules'].indexOf(name) < 0 and not name.startsWith('.')
        yield from walk(entry)
    else if d.isFile()
      yield entry

SELF = new URL(import.meta.url).pathname
ROOT = path.dirname SELF

do =>
  project_name = path.basename(ROOT)

  replace = (p)=>
    txt = fs.readFileSync(p,'utf-8')
    fs.writeFileSync(p, txt.replaceAll('dart_template', project_name))

  for await p from walk(ROOT)
    console.log p
    if p!=SELF
      replace(p)

  for p in ['.git/config']
    replace(path.join(ROOT, p))

  fs.unlinkSync(SELF)

