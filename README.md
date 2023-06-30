# yaml-comments-asciidoc
Extract YAML comments into AsciiDoc modules

## Generate AsciiDoc modules by extracting comment strings from YAML

1. Install yq
2. Point yq at some YAML and generate a csv of comments
3. Generate some AsciiDoc

## Scratch pad

```cmd
asciidoctor -T ./template.erb -E erb out.adoc
```

```asciidoc
[id="example-sno"]
= Comments generated from example-sno.yaml

.Comments generated from example-sno.yaml
[cols="1,3", options="header", format=csv]
|====
include::example-sno.csv[]
|====
```
