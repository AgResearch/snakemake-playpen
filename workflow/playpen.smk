rule default:
    input:
        "wahoo.b.gz"
    default_target: True

rule a2b:
    input: "{path}.a"
    output: "{path}.b"
    shell: "sed -e 's/a/b/g' {wildcards.path}.a >{wildcards.path}.b"

def wildcard_path_endswith_gz(wildcards):
    return wildcards["path"].endswith(".gz")

rule gunzip:
    input:
        branch(wildcard_path_endswith_gz,
               then=[],
               otherwise="{path}.gz")
    output: "{path}"
    shell: "gunzip -k {wildcards.path}.gz"

rule gzip:
    input: "{path}"
    output: "{path}.gz"
    shell: "gzip -k {wildcards.path}"

ruleorder: a2b > gzip > gunzip
