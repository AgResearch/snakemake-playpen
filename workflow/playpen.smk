rule default:
    input:
        "wahoo.b.gz"
    default_target: True

rule a2b:
    input: "{path}.a"
    output: "{path}.b"
    shell: "sed -e 's/a/b/g' {wildcards.path}.a >{wildcards.path}.b"

#rule gunzip:
#    input: "{path}.gz"
#    output: "{path}"
#    shell: "gunzip -k {wildcards.path}.gz"

rule gzip:
    input: "{path}"
    output: "{path}.gz"
    shell: "gzip -k {wildcards.path}"
