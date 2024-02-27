
[private]
list:
    just --list

pull:
    git pull --ff-only

push:
    git push

reconcile name="github" namespace="upbound-system":
    just reconcile-GitRepository "{{ name }}" "{{ namespace }}"
    just reconcile-Kustomization "{{ name }}" "{{ namespace }}"

reconcile-GitRepository name="github" namespace="upbound-system":
    flux reconcile source git "{{ name }}" --namespace="{{ namespace }}"

reconcile-Kustomization name="github" namespace="upbound-system":
    flux reconcile kustomization "{{ name }}" --namespace="{{ namespace }}"
