v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 20 80 20 100 {lab=GND}
N 130 50 130 70 {lab=GND}
N 20 50 50 50 {lab=Vds}
N 20 0 20 20 {lab=Vds}
N 20 -10 20 0 {lab=Vds}
N 20 -10 130 -10 {lab=Vds}
N 50 10 50 50 {lab=Vds}
N 20 10 50 10 {lab=Vds}
N -80 50 -20 50 {lab=Vgs}
N -80 -10 20 -10 {lab=Vds}
C {/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} 0 50 0 0 {name=M1
W=3.5
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {vsource.sym} 130 20 0 0 {name=Vds value=0 savecurrent=false}
C {vsource.sym} -80 20 0 0 {name=Vgs value=0 savecurrent=false}
C {gnd.sym} 20 100 0 0 {name=l2 lab=GND}
C {gnd.sym} 130 70 0 0 {name=l3 lab=GND}
C {code_shown.sym} -260 -130 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.save all"}
C {code_shown.sym} -260 -60 0 0 {name=s2 only_toplevel=false value=".dc Vgs 0 2.2 1m Vds 0 2.2 0.2
.save all
.end"}
C {lab_pin.sym} 40 -10 1 0 {name=p1 sig_type=std_logic lab=Vds
}
C {lab_pin.sym} -80 50 0 0 {name=p2 sig_type=std_logic lab=Vgs
}
