v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 10 -20 10 30 {lab=Vout}
N 10 -120 10 -80 {lab=VDD}
N 10 90 10 140 {lab=VSS}
N -60 -50 -30 -50 {lab=Vin}
N -60 -50 -60 60 {lab=Vin}
N -60 60 -30 60 {lab=Vin}
N -110 10 -60 10 {lab=Vin}
N 10 10 120 10 {lab=Vout}
N 10 -50 30 -50 {lab=VDD}
N 30 -90 30 -50 {lab=VDD}
N 10 -90 30 -90 {lab=VDD}
N 10 60 30 60 {lab=VSS}
N 30 60 30 110 {lab=VSS}
N 10 110 30 110 {lab=VSS}
C {/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} -10 60 0 0 {name=M1
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
C {/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -10 -50 0 0 {name=M2
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
C {iopin.sym} 10 -120 3 0 {name=p1 lab=VDD}
C {iopin.sym} 10 140 1 0 {name=p2 lab=VSS}
C {ipin.sym} -110 10 0 0 {name=p3 lab=Vin}
C {opin.sym} 120 10 0 0 {name=p4 lab=Vout}
