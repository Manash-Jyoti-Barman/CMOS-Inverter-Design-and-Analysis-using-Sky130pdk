# CMOS-Inverter-Design-and-Analysis-using-Sky130pdk
 This repository documents the characterization and analysis of nMOS and pMOS devices as well as design and analysis of a CMOS inverter using various open source tools like Xschem, Ngspice, MAGIC, Netgen etc.
 ### Analysis of nMOS and pMOS
 Here we have used the 1.8V standard model of nMOS and pMOS in the SkyWater 130nm open-source Process Design Kit (PDK) for the analyis to determine parameters like threshold voltage, transconductance, and output resistance. The extracted parameters provide insight into device operation, including switching behavior and drive strength, and form the basis for selecting appropriate transistor dimensions in the CMOS inverter design.
 ### Design and Analysis of CMOS Inverter
 After the nMOS and pMOS analysis, we start to design the CMOS inverter using nMOS and pMOS devices characterized in the previous stage. The inverter is analyzed under both DC and transient conditions to study its voltage transfer behavior, noise immunity, delay characteristics, and power dissipation. The the impact of transistor sizing and load capacitance on inverter performance is examined to establish design trade-offs relevant to CMOS digital circuits.

---

## Contents
- [1. Tools and PDK](#1-Tools-and-PDK)
  - [1.1 Xschem](#11-Xschem)
  - [1.2 Ngspice](#12-Ngspice)
  - [1.3 Magic](#13-Magic)
  - [1.4 Netgen](#14-Netgen)
  - [1.5 Skywater Technology](#12-Skywater-Technology)
- [2. Analysis of MOSFET models](#2-Analysis-of-MOSFET-models)
  - [2.1 General MOS analysis](#21-General-MOS-analysis)
  - [2.2 Strong 0 and Weak 1](#22-Strong-0-and-Weak-1)
  - [2.3 Weak 0 and Strong 1](#23-Weak-0-and-Strong-1)
- [3. CMOS Inverter Design and Analysis](#3-CMOS-Inverter-Design-and-Analysis)
  - [3.1 Why CMOS Circuits](#31-Why-CMOS-Circuits) 
  - [3.2 Design of CMOS inverter circuit](#32-Design-of-CMOS-inverter-circuit)
  - [3.3 Analysis of CMOS inverter](#32-Analysis-of-CMOS-inverter)
    - [3.3.1 Noise Margin Analysis](#331-Noise-Margin-Analysis)
    - [3.3.2 Delay Analysis](#332-Delay-Analysis)
    - [3.3.3 Power Dissipation Analysis](#332-Power-Dissipation-Analysis)

## 1. Tools and PDK
### 1.1 Xschem
![image](https://user-images.githubusercontent.com/43693407/143311382-8cd3c1c9-dd07-4179-892d-52e9cf71e5a7.png)

[Xschem](http://repo.hu/projects/xschem/xschem_man/xschem_man.html) is a schematic capture program that allows to interactively enter an electronic circuit using a graphical and easy to use interface. When the schematic has been created a circuit netlist can be generated for simulation. is an open-source schematic capture tool widely used in analog and digital integrated circuit design workflows. In this project, Xschem is employed to create transistor-level schematics of NMOS, PMOS, and CMOS inverter circuits using the SKY130 PDK device symbols. It provides a flexible environment for hierarchical schematic design and seamless integration with circuit simulators such as Ngspice. Xschem enables accurate netlisting of schematics, which is essential for performing DC, transient, and parametric simulations. Its support for technology-specific symbol libraries makes it suitable for CMOS design and analysis using open-source process design kits.
 > [xschem manual](https://xschem.sourceforge.io/stefan/xschem_man/xschem_man.html)

### 1.2 Ngspice
![image](https://user-images.githubusercontent.com/49194847/138070431-d95ce371-db3b-43a1-8dbe-fa85bff53625.png)

[Ngspice](http://ngspice.sourceforge.net/devel.html) is an open-source SPICE-based circuit simulation tool used for the analysis of analog and digital electronic circuits. In this project, Ngspice is utilized to perform DC, transient, and parametric simulations of NMOS, PMOS, and CMOS inverter circuits designed using the SKY130 PDK. It enables the evaluation of current–voltage characteristics, voltage transfer behavior, timing parameters, and power consumption. Ngspice supports device-level modeling and script-based simulation control, making it well suited for extracting MOSFET parameters and analyzing inverter performance under varying operating conditions.
 > [ngspice manual](https://ngspice.sourceforge.io/docs.html)

### 1.3 Magic
![image](https://user-images.githubusercontent.com/49194847/138071384-a2c83ba4-3f9c-431a-98da-72dc2bba38e7.png)

[Magic](http://opencircuitdesign.com/magic/) is an open-source layout editor used for physical design of integrated circuits. In this project, Magic is employed to create the physical layout of the CMOS inverter using design rules provided by the SKY130 PDK. It supports design rule checking (DRC) to ensure layout correctness and allows extraction of parasitic components from the layout. The extracted layout information is used for post-layout simulation, enabling evaluation of the impact of parasitic capacitances and resistances on inverter performance. Magic plays a key role in bridging schematic-level design and physical implementation in the CMOS design flow.
 > [magic manual](http://opencircuitdesign.com/magic/magic_docs.html)

### 1.4 Netgen
![image](https://github.com/SudeepGopavaram/Design_and_analysis_of_nmos_and_pmos_using_sky130pdk/assets/57873021/215efd81-b834-4845-a390-d8c8be694ed2)

[Netgen](http://opencircuitdesign.com/netgen/) is an open-source verification tool used for layout versus schematic (LVS) checking in integrated circuit design flows. In this project, Netgen is used to compare the netlist extracted from the physical layout with the netlist generated from the schematic to ensure logical equivalence between the two representations. This verification step confirms that the implemented layout correctly reflects the intended circuit design. Netgen thereby ensures design correctness before post-layout simulation and helps identify connectivity or device mismatch issues in the CMOS inverter layout.
 > [magic manual](http://opencircuitdesign.com/netgen/tutorial/tutorial.html)

### 1.5 SkyWater Technology
![image](https://user-images.githubusercontent.com/49194847/138075630-d1bdacac-d37b-45d3-88b5-80f118af37cd.png)

[SkyWater](https://www.skywatertechnology.com/technology-and-design-enablement/) is an open-source CMOS technology kit based on a 130 nm process, providing device models, design rules, and layout information required for integrated circuit design. In this project, the SKY130 PDK is used to access accurate NMOS and PMOS transistor models for schematic-level simulation and physical design. The PDK supplies technology-specific parameters for circuit simulation, layout rule checking, and parasitic extraction, enabling consistent pre-layout and post-layout analysis. Its open availability makes it suitable for academic research and educational CMOS design projects.
 > [skywater pdk manual](https://skywater-pdk.readthedocs.io/en/main/)

## 2. Analysis of MOSFET models
MOSFET models describe the electrical behavior of transistors under various biasing conditions and are essential for accurate CMOS circuit analysis. In this section, standard 1.8V nMOS and pMOS models from the SKY130 PDK are analyzed using Xschem and Ngspice to study their current–voltage characteristics and key model parameters. This analysis provides the basis for device characterization and subsequent CMOS inverter design.
The components used are as follows:

1. ```nfet_01v8.sym``` (xschem_sky130 library)<br>
2. ```vsource.sym``` (xschem device library)<br>
3. ```code_shown.sym``` (xschem device library)<br>
4. ```gnd.sym``` (xschem device library)<br>

I generated the netlist using Xschem and then do DC analysis usng Ngspice to plot basic characteristic plots for nMOS and pMOS transistors, i.e. __Ids vs Vds__ and __Ids vs Vgs__.

When I sweep Vgs for different values of Vds in DC analysis, the plot below are obtained:
The above plot is for __Id vs Vgs__ and we can see that the threshold voltage for the nMOS lies between 0.6V and 0.7V

When I sweep Vds for different values of Vgs in DC analysis, the plot below are obtained:
The above plot is for __Id vs Vds__ and we can see the linear and saturation region of the curve of nMOS.

For the plot of transconductance gm for nMOS, I obtained it from __Id vs Vgs__ plot using ```deriv``` command since gm = ∂Id/∂Vgs and for the plot of output conductance go for nMOS, it is obtained similarly from __Id vs Vds__ plot using ```deriv``` command since go = ∂Id/∂Vds or ro = 1/(∂Id/∂Vds):


