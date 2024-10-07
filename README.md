# SnakeMake Playpen

## Ambiguous Rules, arrghh!

Create a file wahoo.a.gz locally:

```
$ echo "Wahoo!" > wahoo.a
$ gzip wahoo.a
```

then why doesn't this create `wahoo.b.gz` ?

```
$ snakemake -s workflow/playpen.smk --cores 1
```

Commenting out the `gunzip` rule and starting from plain old `wahoo.a` works fine.

What's wrong?
