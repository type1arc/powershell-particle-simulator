class Vec3
{
    [float]$x
    [float]$y
    [float]$z

    Vec3([float]$x, [float]$y, [float]$z)
    {
        $this.x = $x
        $this.y = $y
        $this.z = $z
    }

    [float]get_x() { return $this.x }
    [float]get_y() { return $this.y }
    [float]get_z() { return $this.z }
}

class Particle
{
    # particle field
    [float]$x 
    [float]$y

    [float]$vx
    [float]$vy

    [float]$ax
    [float]$ay

    Particle ([float]$x, [float]$y, [float]$vx, [float]$vy, [float]$ax, [float]$ay) # particle constructor
    {
        $this.x = $x
        $this.y = $y

        $this.vx = $vx
        $this.vy = $vy

        $this.ax = $ax
        $this.ay = $ay
    }

    [void]update()
    {
        $this.vx *= $this.ax # applying acceleration to velocity
        $this.vy *= $this.ay
        
        $this.x += $this.vx # applying velocity to position
        $this.y += $this.vy

    }
}

$Particles = @()
for ($i = 0; $i -lt 10; $i++) {
    $Particles += [Particle]::new((Get-Random -Minimum 0 -Maximum 100), (Get-Random -Minimum 0 -Maximum 100), 
                                 (Get-Random -Minimum -2 -Maximum 2), (Get-Random -Minimum -2 -Maximum 2), 
                                 (Get-Random -Minimum -2 -Maximum 2), (Get-Random -Minimum -2 -Maximum 2))
}

for ($step = 0; $step -lt 50; $step++) {
    foreach ($p in $Particles) {
        $p.Update()
        Write-Output "Particle at ($($p.X), $($p.Y))"
    }
    Start-Sleep -Milliseconds 100
}
