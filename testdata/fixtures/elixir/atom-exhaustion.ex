# CWE-400: Atom exhaustion via String.to_atom
# Atoms are never garbage collected, dynamic creation leads to DoS.

defmodule Fixture.AtomExhaustion do
  def vuln(user_input) do
    # ruleid: atom_exhaustion
    String.to_atom(user_input)
    # ruleid: atom_exhaustion
    List.to_atom(user_input)
  end
  def vuln2(data) do
    # ruleid: atom_exhaustion
    String.to_atom(data)
    # ruleid: atom_exhaustion
    List.to_atom(data <> "_suffix")
  end
  def safe do
    # ok: atom_exhaustion
    String.to_existing_atom("fixed")
    # ok: atom_exhaustion
    :fixed_atom
  end
  def safe2 do
    # ok: atom_exhaustion
    String.to_existing_atom("another_fixed")
  end
end
