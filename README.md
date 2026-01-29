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
  - [3.3 Analysis of CMOS inverter](#33-Analysis-of-CMOS-inverter)
    - [3.3.1 Noise Margin Analysis](#331-Noise-Margin-Analysis)
    - [3.3.2 Delay Analysis](#332-Delay-Analysis)
    - [3.3.3 Power Dissipation Analysis](#332-Power-Dissipation-Analysis)
  - [3.4. Layout Design of CMOS inverter](#34-Layout-Design-of-CMOS-inverter)
  - [3.5 Layout vs Schematic](#35-Layout-vs-Schematic)
  - [3.6 Post-Layout Analysis](#36-Post-Layout-Analysis)
    - [3.6.1 Noise Margin Analysis](#361-Noise-Margin-Analysis)
    - [3.6.2 Delay Analysis](#362-Delay-Analysis)
    - [3.6.3 Power Dissipation Analysis](#363-Power-Dissipation-Analysis)

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
### 2.1 General MOS analysis
MOSFET models describe the electrical behavior of transistors under various biasing conditions and are essential for accurate CMOS circuit analysis. In this section, standard 1.8V nMOS and pMOS models from the SKY130 PDK are analyzed using Xschem and Ngspice to study their current–voltage characteristics and key model parameters. This analysis provides the basis for device characterization and subsequent CMOS inverter design.
The components used are as follows:

1. ```nfet_01v8.sym``` (xschem_sky130 library)
2. ```vsource.sym``` (xschem device library)
3. ```code_shown.sym``` (xschem device library)
4. ```gnd.sym``` (xschem device library)

I generated the netlist using Xschem and then do DC analysis usng Ngspice to plot basic characteristic plots for nMOS and pMOS transistors, i.e. **Ids vs Vds** and **Ids vs Vgs**.
![nMOS schematic](./Images/nfet_1v8_sch.png)<br>
When I sweep Vgs (gate-to-source voltage) for different values of Vds (drain-to-source voltage) in DC analysis, the plot below are obtained:
![Id vs Vgs](./Images/Id_vs_Vgs_for_nfet_1v8.png)<br>
The above plot is for **Id vs Vgs** and we can see that the threshold voltage for the nMOS lies between 0.6V and 0.7V

When I sweep Vds (drain-to-source voltage) for different values of Vgs (gate-to-source voltage) in DC analysis, the plot below are obtained:
![Id vs Vds](./Images/Id_vs_Vds_for_nfet_1v8.png)<br>
The above plot is for **Id vs Vds** and we can see the linear and saturation region of the curve of nMOS.

For the plot of transconductance gm for nMOS, I obtained it from **Id vs Vgs** plot using ```deriv``` command since gm = ∂Id/∂Vgs and for the plot of output conductance go for nMOS, it is obtained similarly from **Id vs Vds** plot using ```deriv``` command since go = ∂Id/∂Vds or ro = 1/(∂Id/∂Vds):
![gm vs Vgs](./Images/gm_nfet_1v8.png)<br><br>
![gm vs Vgs](./Images/go_nfet_1v8.png)<br>
For designing an inverter, I have choose the highest value available for Vds which will be 1.8V and find values of drain current (Id), transconductance (gm), and output resistance (rds) at Vgs = 1.8V and Vds = 1.8V:
![Vgs sweep plots](./Images/vgs_sweep_nfet_1v8.png)<br><br>
![Vds sweep plots](./Images/vds_sweep_nfet_1v8.png)<br>
From the above plots and simulations, we get:
1. Id = 0.5009414 mA at Vgs = 1.8V
2. gm = 0.5320934 mS at Vgs = 1.8V
3. Id = 0.5009414 mA at Vds = 1.8V
4. rds = 19.30674KΩ at Vds = 1.8V
We have found all the important values we needed for nMOS and we can do the same for pMOS. The main objective is to decide the aspect ratio to achieve a symmetric CMOS inverter with equal driving strengths. After doing some experiments, I have obtained that at Wp = 3.5 Wn, keeping the L same at 0.15μm. So, After performing same simulations for pMOS at W = 3.5:
![pMOS schematic](./Images/pfet_1v8_sch.png)<br><br>
![Vgs sweep plots](./Images/vgs_sweep_pfet_1v8.png)<br><br>
![Vds sweep plots](./Images/vds_sweep_pfet_1v8.png)<br>
From the above plots and simulations, we get:
1. Id = 0.711175 mA at Vgs = 1.8V
2. gm = 0.8593639 mS at Vgs = 1.8V
3. Id = 0.711175 mA at Vds = 1.8V
4. rds = 6.510506KΩ at Vds = 1.8V
### 2.2 Strong 0 and Weak 1
![nMOS inverter](./Images/nmos_inv.png)<br><br>
![nMOS inverter Transient](./Images/nmos_inv_tran.png)<br>
In the above, when a square wave is applied to the NMOS inverter, a LOW input turns the NMOS OFF and the output is pulled up to 1.8 V. When the input is HIGH, the NMOS turns ON and operates in the linear region as a result it will act as a voltage controlled resistor. The output then forms a voltage divider and does not reach the full logic level. Hence, NMOS passes a strong 0 but only a weak 1.
### 2.3 Weak 0 and Strong 1
![pMOS inverter](./Images/pmos_inv.png)<br><br>
![pMOS inverter Transient](./Images/pmos_inv_tran.png)<br>
The pMOS here passes a strong 1 but only a weak 0 because of the same reason which is explained for the nMOS. When input is LOW, the pMOS turns ON and operates in linear region acting as a voltage controlled resistor. 

## 3. CMOS Inverter Design and Analysis
### 3.1 Why CMOS Circuits
From the above section, it is observed that pMOS passes strong 1 and nMOS passes weak 0. Neither nMOS nor pMOS alone can be used to design an inverter to produce HIGH and LOW values. But we can use both together to achieve this since they complement each other. The pMOS is used as a pull-up network since it passes strong 1 and the nMOS is used as a pull-down network since it passes strong 0.<br>
So, the circuit of CMOS consists of pMOS transistor between Vdd and Vout and nMOS circuit between Vout and GND (series with pMOS). When we give input logic 0, pMOS is ON and nMOS is OFF which makes current flow from VDD to Vout resulting in output logic 1. Similarly, when we give input logic 1, nMOS is turned ON and pMOS is turned OFF which makes the current flow from Vout node to GND resulting in output logic 0. In this way, CMOS can provide **rail-to-rail** output.
### 3.2 Design of CMOS inverter circuit
Using the above theory, I have used the standard 1.8V models of pMOS and nMOS from Skywater 130nm PDK to design a CMOS inverter. The schematic and symbol of the inverter designed using Xschem is given below:
![CMOS inverter schematic](./Images/cmos_inv_sch.png)<br><br>
![CMOS inverter symbol](./Images/cmos_inv_sym.png)<br>
Although a CMOS inverter is conceptually simple, its design involves several important trade-offs between speed, power, noise margin, and area. In a CMOS inverter, optimizing one performance metric usually degrades another, so it requires careful balancing based on the target application and technology constraints. In this project I have tried to achieve ideal Vm = Vdd/2. This is important for having symmetric Noise Margins and Delays.<br>
Theoretically to achieve this, I should take Wp = 2*Wn but models used from Skywater 130nm PDK, it is achieved when I take Wp = 3.5*Wn.
### 3.3.1 Noise Margin Analysis
Noise margin is a measure of the inverter’s ability to tolerate noise without causing a logic error. It is derived directly from the Voltage Transfer Characteristics (VTC). The Voltage Transfer Characteristic (VTC) of a CMOS inverter represents the relationship between the output voltage (Vout) and the input voltage(Vin). It is obtained by performing a DC sweep of the input voltage while keeping the supply voltage constant. The VTC curve shows three operating regions: low-input/high-output, transition region, and high-input/low-output. The slope of the curve in the transition region indicates the inverter gain, and the switching threshold voltage Vm is defined as the point where Vin = Vout.<br>
![VTC](./Images/vtc_char_cmos.jpg)
![noise margin](./Images/noise_margin.png)<br>
I have created a testbench for my designed inverter feeding it Vdd = 1.8V and a input pulse which oscillates between 0 to 1.8V and has a period of 6.6ns:
![CMOS inverter testbench](./Images/cmos_inv_tb.png)<br>
After running simulation for DC analysis we get the results below:
![CMOS inverter VTC](./Images/cmos_inv_vtc.png)<br>
From the above Voltage Transfer Characteristic curve of CMOS inverter, it can be seen that the Vm is very close to 0.9V i.e. half of 1.8V. Also, from the VTC, the following critical points can be found:<br><br>
    **VOH** - Maximum output voltage when it is logic '1'.<br>
    **VOL** - Minimun output voltage when it is logic '0'.<br>
    **VIH** - Maximum input voltage that can be interpreted as logic '0'.<br>
    **VIL** - Minimum input voltage that can be interpreted as logic '1'.<br>
    **Vm** - Switching Threshold voltage<br><br>
The Points VIL, VIH, VOL and VOH lies on the curve where the magnitude of the slope is 1 and Vth lies where Vin = Vout. So, I have used the ```meas``` command tofrom  find these points the plot:
![CMOS inverter dc](./Images/cmos_inv_dc.png)<br>
The values of the points obtained from the above plot:
| Voltage | Value |
|---------|-------|
| Vm | 0.899V |
|   VOH   | 1.746V  |
|   VOL   |  0.0701V   |
|   VIH   | 1.026V |
|   VIL   | 0.775V |

There are two such values of Noise margins for a binary system. The calculation of Noise margin are done using the two expressions:<br>
NOISE MARGIN LOW: **NML = VIL - VOL**<br>
NOISE MARGIN HIGH: **NMH = VOH - VIH**<br>

The Noise margin values obtained for our inverter are **NML = 0.705V** and **NMH = 0.72V**.
Since we have obtained the Vm very close to 0.9, so the noise margins obatined are very close to each other.

### 3.3.2 Delay Analysis
For the delay analysis, transient analysis is used since it is a time-domain phenomenon. I have used the same testbench that I used before for my inverter for Noise Margin analysis. The obtained transient analysis plot for Vin and Vout is shown below:
![CMOS inverter tran](./Images/cmos_inv_tran.png)<br>
From the above plot, I have calculated the propagation delay first. **Propagation delay** is defined as the time it takes for a change at the input of a gate to cause a corresponding change at the output. It is measured between the 50% points of the input and output voltage waveforms. In a CMOS inverter:<br>
tpHL: Time delay when output falls from HIGH to LOW.<br>
tpLH: Time delay when output rises from LOW to HIGH.<br>
The average propagation delay is given by:<br>
tp = (tpHL+tpLH)/2
![propagation delay](./Images/prop_delay.jpg)<br>
![propagation delay](./Images/cmos_inv_propdelay.png)<br>
So I have obtained **tpLH = 42.308ps** and **tpLH = 47.394ps**, then calculated **tp = 44.851ps**. <br>​
Propagation delay in depends on the input, specifically the input transition time (**input slew rate**), as faster inputs generally lead to lesser delays. Propagation delay alone is sufficient only for an isolated gate with fixed input slew. In real digital systems, gates are cascaded, and since delay depends on input slew, rise and fall times must be known to correctly predict timing, power, and reliability of the entire path.<br>
![rise and fall time](./Images/rise_and_fall_time_35-1.png)<br>
The above rise and fall time analysis is for Wp = 3.5 and Wn = 1. Also it is defined for the transition when output goes from 90% to 10% for fall time, and from 10% to 90% transition for rise time. The results are **trise = 123.587ps** and **tfall = 89.804ps**.<br>

The rise time and fall time should be minimized in a CMOS inverter To reduce delay in cascaded logic (input-slew dependence). I tried to reduce it by following ways:
1. **Increase supply power Vdd**: A higher Vdd could drive more current leading to faster transitions but it would increase dynamic power and short circuit in our circuit. So, I found that it is not preferred.
2. **Increase width of transistors**: Increasing transistor widths could increase their drive strengths decreasing rise and fall time because it would reduce Ron. However, tradeoff here is area. So I made Wp = 4 and Wn = 2 and run the simulations:
![rise and fall time](./Images/rise_and_fall_time_4-2.png)<br>
Here, I get unexpected results as trise decreased and tfall increased. This can be explained because in unloaded analysis, the internal capacitance also scales with the transistor width along with the increasing driving strengths. So I tried to perform loaded analysis by taking a load capacitance of 0.1pF:
![CMOS inverter testbench](./Images/cmos_inv_tb_cap.png)<br>
![rise and fall time](./Images/rise_and_fall_time_cap-point1p.png)<br>
In the above unloaded analysis where I have taken Wp = 3.5 and Wn = 1, we get **trise = 341.163ps** and t**fall = 371.712ps**<br><br>
![rise and fall time](./Images/rise_and_fall_time_cap-point1p(2)_4-2.png)<br>
In another unloaded analysis where I have taken Wp = 4 and Wn = 2, we get **trise = 301.795ps** and **tfall = 226.137ps**<br><br>
It is observed that clearly both decreases here. trise decreased by a lesser amount compared to tfall because Wp if increased by 0.5 only and Wn is increased to twice. In loaded analysis, the presence of a large external load capacitance makes drive strength the dominant factor, resulting in predictable reductions in rise and fall times with increased transistor widths.<br><br>

### 3.3.3 Power Dissipation Analysis
For Power dissipation I have done transient analysis of my loaded inverter testbench with Wp = 3.5 and Wn = 1. I have used the ```integ``` to perform integration of the current from Vdd source in the formula Pavg ​= (1/T) ∫[0→T] V_DD · I_DD(t) dt. For the time period in integration I have taken the second period from 6.6ns to 13.2ns since first period may conatain some anomaly.
![power](./Images/cmos_inv_power.png)<br>
Since the current is very small I have scale it up by 1000, so that it can be seen properly on the plot. The result obtained after power analysis is **Power_avg = 50.654 μW**. This includes dynamic power and short-circuit power.

### 3.4 Layout Design of CMOS inverter
At this stage I have tried to design a DRC-clean CMOS inverter layout corresponding to the schematic design, ensuring correct transistor sizing and proper connectivity. **Design Rule Check (DRC)** is a verification step used in VLSI layout design to ensure that the physical layout follows all fabrication rules defined by the technology, here it is SkyWater 130nm. I have used **MAGIC VLSI** and TCL language for designing the a standard full-custom layout of CMOS inverter. I have kept the transistor sizes in layout same as I have taken in schematic. For designing the layout, I have referred the metal stack diagram and Design Rules from the [SkyWater SKY130 PDK](https://skywater-pdk.readthedocs.io/en/main/rules/assumptions.html) documentation itself. Below is the metal stack diagram:
![metal stack diagram](./Images/metal_stack.png)<br>​
Below is the layout of the CMOS inverter I have designed and it is completed with 0 DRC errors.:<br>
<img src = "./Images/inv_layout.png" width = "70%" height = "70%"></img><br>
I have extracted the parasitics from the circuit and those parasitics are written in the spice netlist of the above layout deisgn.

### 3.5 Layout vs Schematic
Layout Versus Schematic (LVS) is a verification step used in VLSI design to ensure that the physical layout represents the same circuit as the schematic. I have used **Netgen** for LVS and it needs spice netlists of both layout and schematic. I have extracted the inv_layout.ext file from Magic and converted it inv_layout.spice. Below is the Result of LVS in Netgen:<br>
![lvs](./Images/lvs_result.png)<br>
The LVS result indicates that both the schematic and layout contain one NMOS and one PMOS transistor and four nets, corresponding to VDD, VSS, Vin, and Vout. Netgen reported that the two circuits match uniquely, confirming correct device count and connectivity between the schematic and the layout. Although some device geometry parameters (such as diffusion area, perimeter, and multiplicity) were not reported in the LVS output, the successful match confirms the logical equivalence of the design.

### 3.6 Post-Layout Analysis
Post-layout analysis was carried out using Xschem and NGSPICE. The parasitic-extracted (PEX) netlist obtained from the CMOS inverter layout was included in the testbench (same used in pre-layout analysis), replacing the pre-layout schematic to evaluate the circuit performance with layout-induced parasitic effects. The Simulations results are as follows:

### 3.6.1 Noise Margin Analysis
![post-layout noise margin](./Images/postlayout_noisemargin.png)<br>
### 3.6.2 Delay Analysis
![post-layout delay](./Images/postlayout_propdelay.png)<br>
![post-layout rise and fall time](./Images/postlayout_risefalltime.png)<br>
### 3.6.3 Power Dissipation Analysis
![post-layout power](./Images/postlayout_power.png)<br>
