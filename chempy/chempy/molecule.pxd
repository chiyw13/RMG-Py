################################################################################
#
#   ChemPy - A chemistry toolkit for Python
#
#   Copyright (c) 2010 by Joshua W. Allen (jwallen@mit.edu)
#
#   Permission is hereby granted, free of charge, to any person obtaining a
#   copy of this software and associated documentation files (the 'Software'),
#   to deal in the Software without restriction, including without limitation
#   the rights to use, copy, modify, merge, publish, distribute, sublicense,
#   and/or sell copies of the Software, and to permit persons to whom the
#   Software is furnished to do so, subject to the following conditions:
#
#   The above copyright notice and this permission notice shall be included in
#   all copies or substantial portions of the Software.
#
#   THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#   DEALINGS IN THE SOFTWARE.
#
################################################################################

from graph cimport Vertex, Edge, Graph
from pattern cimport AtomPattern, BondPattern, MoleculePattern, AtomType
from element cimport Element

################################################################################

cdef class Atom(Vertex):

    cdef public Element element
    cdef public short radicalElectrons
    cdef public short spinMultiplicity
    cdef public short implicitHydrogens
    cdef public short charge
    cdef public str label
    cdef public AtomType atomType

    cpdef bint equivalent(self, Vertex other)

    cpdef bint isSpecificCaseOf(self, Vertex other)

    cpdef Atom copy(self)

    cpdef bint isHydrogen(self)

    cpdef bint isNonHydrogen(self)

    cpdef bint isCarbon(self)

    cpdef bint isOxygen(self)

################################################################################

cdef class Bond(Edge):

    cdef public str order

    cpdef bint equivalent(self, Edge other)

    cpdef bint isSpecificCaseOf(self, Edge other)

    cpdef Bond copy(self)

    cpdef bint isSingle(self)

    cpdef bint isDouble(self)

    cpdef bint isTriple(self)

################################################################################

cdef class Molecule(Graph):

    cdef public bint implicitHydrogens
    cdef public int symmetryNumber

    cpdef addAtom(self, Atom atom)

    cpdef addBond(self, Atom atom1, Atom atom2, Bond bond)

    cpdef dict getBonds(self, Atom atom)

    cpdef Bond getBond(self, Atom atom1, Atom atom2)

    cpdef bint hasAtom(self, Atom atom)

    cpdef bint hasBond(self, Atom atom1, Atom atom2)

    cpdef removeAtom(self, Atom atom)

    cpdef removeBond(self, Atom atom1, Atom atom2)

    cpdef sortAtoms(self)

    cpdef str getFormula(self)

    cpdef double getMolecularWeight(self)

    cpdef Graph copy(self, bint deep=?)

    cpdef makeHydrogensImplicit(self)

    cpdef makeHydrogensExplicit(self)

    cpdef clearLabeledAtoms(self)

    cpdef bint containsLabeledAtom(self, str label)

    cpdef Atom getLabeledAtom(self, str label)

    cpdef dict getLabeledAtoms(self)

    cpdef bint isIsomorphic(self, Graph other, dict initialMap=?)

    cpdef tuple findIsomorphism(self, Graph other, dict initialMap=?)

    cpdef bint isSubgraphIsomorphic(self, Graph other, dict initialMap=?)

    cpdef tuple findSubgraphIsomorphisms(self, Graph other, dict initialMap=?)

    cpdef bint isAtomInCycle(self, Atom atom)

    cpdef bint isBondInCycle(self, Atom atom1, Atom atom2)

    cpdef draw(self, str path)

    cpdef fromCML(self, str cmlstr, bint implicitH=?)

    cpdef fromInChI(self, str inchistr, bint implicitH=?)

    cpdef fromSMILES(self, str smilesstr, bint implicitH=?)

    cpdef fromOBMol(self, obmol, bint implicitH=?)

    cpdef fromAdjacencyList(self, str adjlist)

    cpdef str toCML(self)

    cpdef str toInChI(self)

    cpdef str toSMILES(self)

    cpdef toOBMol(self)

    cpdef toAdjacencyList(self)

    cpdef bint isLinear(self)

    cpdef int countInternalRotors(self)

    cpdef getAdjacentResonanceIsomers(self)

    cpdef findAllDelocalizationPaths(self, Atom atom1)

    cpdef int calculateAtomSymmetryNumber(self, Atom atom)

    cpdef int calculateBondSymmetryNumber(self, Atom atom1, Atom atom2)

    cpdef int calculateAxisSymmetryNumber(self)

    cpdef int calculateCyclicSymmetryNumber(self)

    cpdef int calculateSymmetryNumber(self)
