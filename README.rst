==========================================================
Data Repository
==========================================================
Source code and data files for the manuscript Probing electron-phonon coupling away from the Fermi level with resonant inelastic x-ray scattering. Generate the figures by opening a terminal and running

.. code-block:: bash

       octave fig1.m


How to cite
-----------
If this data is used, please cite Probing electron-phonon coupling away from the Fermi level with resonant inelastic x-ray scattering
C. D. Dashwood, A. Geondzhian, J. G. Vale, A. C. Pakpour-Tabrizi, C. A. Howard, Q. Faure, L. S. I. Veiga, D. Meyers, S. G. Chiuzbaian, A. Nicolaou, N. Jaouen, R. B. Jackman, A. Nag, M. Garc´ıa-Fern´andez, Ke-Jin Zhou, A. C. Walters, K. Gilmore, D. F. McMorrow, and M. P. M. Dean, `Phys. Rev. X 11, 041052 (2021) <https://www.doi.org/10.1103/PhysRevX.11.041052>`_

Interactions between electrons and lattice vibrations are responsible for a wide range of material
properties and applications. While there are a number of well-established experimental probes of
electron-phonon coupling (EPC), they generally either lack momentum resolution or rely on indirect
self-energy effects. There has therefore been considerable interest in the development of resonant
inelastic x-ray scattering (RIXS) as a momentum-resolved probe of EPC. Here, using high-resolution
carbon K-edge measurements of graphite, we demonstrate that RIXS is able to access the EPC away
from the Fermi level, setting it apart from all other established techniques. By tuning the incident
x-ray energy we are able to separately probe the couplings of the π∗ or σ∗ electronic states, finding
qualitatively different RIXS spectra for each. Our data highlight that multi-phonon features in the
spectra contain contributions from phonons away from the experimental momentum transfer, and
are therefore sensitive to the EPC strength throughout the Brillouin zone. We develop a Green’s
function method to model our data, in which we account for the phonon and EPC dispersions as
well as phonon mode mixing in the intermediate RIXS state. This model provides an excellent
description of the observed spectra, showing that the EPC is concentrated at the Γ and K points
for the π∗ states, while being significant across the Brillouin zone for the σ∗ states. Our results
significantly advance the interpretation of phonons in RIXS, and extend its applicability as a probe
of EPC to a new range of technologically important out-of-equilibrium situations.

Run locally
-----------

Work with this by installing `docker <https://www.docker.com/>`_ and pip and then running

.. code-block:: bash

       pip install jupyter-repo2docker
       jupyter-repo2docker --editable .

Change `tree` to `lab` in the URL for JupyterLab.

Run remotely
------------

.. image:: https://mybinder.org/badge_logo.svg
 :target: https://mybinder.org/v2/gh/mpmdean/Dashwood2021probing/HEAD?filepath=index.ipynb
