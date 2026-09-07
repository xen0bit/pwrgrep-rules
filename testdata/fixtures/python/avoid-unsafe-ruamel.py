# ruamel.yaml with typ='unsafe'/'base' constructs arbitrary objects
# while parsing. Flag those modes; 'safe' (or 'rt') is the fix.
import ruamel.yaml


def flag_unsafe(stream):
    # ruleid: avoid-unsafe-ruamel
    yaml = ruamel.yaml.YAML(typ='unsafe')
    # ruleid: avoid-unsafe-ruamel
    yaml = ruamel.yaml.YAML(typ='base')
    # ruleid: avoid-unsafe-ruamel
    yaml = ruamel.yaml.YAML(pure=True, typ='unsafe')


def safe_modes(stream):
    # ok: avoid-unsafe-ruamel
    yaml = ruamel.yaml.YAML(typ='safe')
    # ok: avoid-unsafe-ruamel
    yaml = ruamel.yaml.YAML(typ='rt')
    # ok: avoid-unsafe-ruamel
    yaml = ruamel.yaml.YAML()
