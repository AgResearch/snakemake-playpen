rule default:
    input:
        "wahoo.b.gz"
    default_target: True

rule a2b:
    input: "{path}.a"
    output: "{path}.b"
    shell: "sed -e 's/a/b/g' {wildcards.path}.a >{wildcards.path}.b"

rule gunzip:
    input:
        branch(lambda wildcards: not wildcards["path"].endswith(".gz"),
               then="{path}.gz",
               otherwise="/N/A")
    output: "{path}"
    shell: "gunzip -k {wildcards.path}.gz"

rule gzip:
    input:
        branch(lambda wildcards: not wildcards["path"].endswith(".gz"),
               then="{path}",
               otherwise="/N/A")
    output: "{path}.gz"
    shell: "gzip -k {wildcards.path}"
