v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -70 20 -20 20 {lab=Vgs}
N -70 80 -70 100 {lab=GND}
N 140 -10 140 10 {lab=GND}
N 20 -70 20 -10 {lab=Vds}
N 20 -70 140 -70 {lab=Vds}
N 20 50 20 70 {lab=GND}
N 20 20 40 20 {lab=GND}
N 40 20 40 60 {lab=GND}
N 20 60 40 60 {lab=GND}
C {/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} 0 20 0 0 {name=M1
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {vsource.sym} -70 50 0 0 {name=Vgs value=1.8 savecurrent=false}
C {vsource.sym} 140 -40 0 0 {name=Vds value=0 savecurrent=false}
C {gnd.sym} -70 100 0 0 {name=l1 lab=GND}
C {gnd.sym} 140 10 0 0 {name=l2 lab=GND}
C {gnd.sym} 20 70 0 0 {name=l3 lab=GND}
C {code_shown.sym} -300 -190 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.save all"}
C {code_shown.sym} -300 -120 0 0 {name=s2 only_toplevel=false value=".dc Vds 0 2.2 1m Vgs 0 2.2 0.2
.save all
.end"}
C {lab_pin.sym} 20 -40 0 0 {name=p1 sig_type=std_logic lab=Vds}
C {lab_pin.sym} -70 20 0 0 {name=p2 sig_type=std_logic lab=Vgs}
