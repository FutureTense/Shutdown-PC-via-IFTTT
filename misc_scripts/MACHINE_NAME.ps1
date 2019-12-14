# This script will start a VirtualBox machine when the user logs in.  Using the Windows auto login
# feature is recommended.  Copy StartVM.ps1 to your userprofile directory.  To open this directory in
# a Windows Explorer Window press Windows-R and type %userprofile# then press enter.

# You need a copy of this file for each VM you want to run at startup in your start directory.
# To open this directory in a Windows Explorer Window press Windows-R and type shell:startup then
# press enter.  Copy this file and rename it so that it matches the name of the VM you see
# in the VirtualBox Mangaer GUI.


$default = "Y"
$seconds = 4

Import-module ([io.path]::combine(${env:userprofile}, 'StartVM.ps1')) -Force

$vm = $MyInvocation.MyCommand.Name.Replace(".ps1","")

Write-Host "Virtual Machine: " -NoNewline Write-Host $VM.ToUpper() -ForegroundColor Yellow
Write-Host ""

$r = Timeout-Prompt -message $("Press Y to start VM, or any other key to cancel") -default $default -seconds $seconds
Write-Host ""

if ($r -eq "Y"){
    Write-Host "Starting Virtual Machine: " -NoNewline 
    Write-Host $VM.ToUpper() -ForegroundColor Yellow
    Write-Host ""
    & 'C:\Program Files\Oracle\VirtualBox\VBoxManage.exe' startvm $vm --type headless
} else {
    Write-Host "Start cancelled: " -ForegroundColor Red
    Write-Host ""
}

# SIG # Begin signature block
# MIIfoQYJKoZIhvcNAQcCoIIfkjCCH44CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUrg7hzGUaWRP8RV62AO2xhe8Y
# WcSgghl7MIIEhDCCA2ygAwIBAgIQQhrylAmEGR9SCkvGJCanSzANBgkqhkiG9w0B
# AQUFADBvMQswCQYDVQQGEwJTRTEUMBIGA1UEChMLQWRkVHJ1c3QgQUIxJjAkBgNV
# BAsTHUFkZFRydXN0IEV4dGVybmFsIFRUUCBOZXR3b3JrMSIwIAYDVQQDExlBZGRU
# cnVzdCBFeHRlcm5hbCBDQSBSb290MB4XDTA1MDYwNzA4MDkxMFoXDTIwMDUzMDEw
# NDgzOFowgZUxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJVVDEXMBUGA1UEBxMOU2Fs
# dCBMYWtlIENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEhMB8G
# A1UECxMYaHR0cDovL3d3dy51c2VydHJ1c3QuY29tMR0wGwYDVQQDExRVVE4tVVNF
# UkZpcnN0LU9iamVjdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAM6q
# gT+jo2F4qjEAVZURnicPHxzfOpuCaDDASmEd8S8O+r5596Uj71VRloTN2+O5bj4x
# 2AogZ8f02b+U60cEPgLOKqJdhwQJ9jCdGIqXsqoc/EHSoTbL+z2RuufZcDX65OeQ
# w5ujm9M89RKZd7G3CeBo5hy485RjiGpq/gt2yb70IuRnuasaXnfBhQfdDWy/7gbH
# d2pBnqcP1/vulBe3/IW+pKvEHDHd17bR5PDv3xaPslKT16HUiaEHLr/hARJCHhrh
# 2JU022R5KP+6LhHC5ehbkkj7RwvCbNqtMoNB86XlQXD9ZZBt+vpRxPm9lisZBCzT
# bafc8H9vg2XiaquHhnUCAwEAAaOB9DCB8TAfBgNVHSMEGDAWgBStvZh6NLQm9/rE
# JlTvA73gJMtUGjAdBgNVHQ4EFgQU2u1kdBScFDyr3ZmpvVsoTYs8ydgwDgYDVR0P
# AQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEQG
# A1UdHwQ9MDswOaA3oDWGM2h0dHA6Ly9jcmwudXNlcnRydXN0LmNvbS9BZGRUcnVz
# dEV4dGVybmFsQ0FSb290LmNybDA1BggrBgEFBQcBAQQpMCcwJQYIKwYBBQUHMAGG
# GWh0dHA6Ly9vY3NwLnVzZXJ0cnVzdC5jb20wDQYJKoZIhvcNAQEFBQADggEBAE1C
# L6bBiusHgJBYRoz4GTlmKjxaLG3P1NmHVY15CxKIe0CP1cf4S41VFmOtt1fcOyu9
# 08FPHgOHS0Sb4+JARSbzJkkraoTxVHrUQtr802q7Zn7Knurpu9wHx8OSToM8gUmf
# ktUyCepJLqERcZo20sVOaLbLDhslFq9s3l122B9ysZMmhhfbGN6vRenf+5ivFBjt
# pF72iZRF8FUESt3/J90GSkD2tLzx5A+ZArv9XQ4uKMG+O18aP5cQhLwWPtijnGMd
# ZstcX9o+8w8KCTUi29vAPwD55g1dZ9H9oB4DK9lA977Mh2ZUgKajuPUZYtXSJrGY
# Ju6ay0SnRVqBlRUa9VEwggTQMIIDuKADAgECAgEHMA0GCSqGSIb3DQEBCwUAMIGD
# MQswCQYDVQQGEwJVUzEQMA4GA1UECBMHQXJpem9uYTETMBEGA1UEBxMKU2NvdHRz
# ZGFsZTEaMBgGA1UEChMRR29EYWRkeS5jb20sIEluYy4xMTAvBgNVBAMTKEdvIERh
# ZGR5IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IC0gRzIwHhcNMTEwNTAzMDcw
# MDAwWhcNMzEwNTAzMDcwMDAwWjCBtDELMAkGA1UEBhMCVVMxEDAOBgNVBAgTB0Fy
# aXpvbmExEzARBgNVBAcTClNjb3R0c2RhbGUxGjAYBgNVBAoTEUdvRGFkZHkuY29t
# LCBJbmMuMS0wKwYDVQQLEyRodHRwOi8vY2VydHMuZ29kYWRkeS5jb20vcmVwb3Np
# dG9yeS8xMzAxBgNVBAMTKkdvIERhZGR5IFNlY3VyZSBDZXJ0aWZpY2F0ZSBBdXRo
# b3JpdHkgLSBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALngyxDU
# r3a91JNi6zBkuIEIbMME2WIXji//PmXPj85i5jxSHNoWRUtVq3hrY4NikM4PaWyZ
# yBoUi0zMRTPqiNyeo68r/oBhnXlXxM8u9D8wPF1H/JoWvMM3lkFRjhFLVPgovtCM
# vvAwOB7zsCb4Zkdjbd5xJkePOEdT0UYdtOPcAOpFrL28cdmqbwDb280wOnlPX0xH
# +B3vW8LEnWA7sbJDkdikM07qs9YnT60liqXG9NXQpq50BWRXiLVEVdQtKjo++Li9
# 6TIKApRkxBY6UPFKrud5M68MIAd/6N8EOcJpAmxjUvp3wRvIdIfIuZMYUFQ1S2lO
# vDvTSS4f3MHSUvsCAwEAAaOCARowggEWMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0P
# AQH/BAQDAgEGMB0GA1UdDgQWBBRAwr0njsw0gzCiM9f7bLPwtCyAzjAfBgNVHSME
# GDAWgBQ6moUHEGcotu/2vQVBbiDBlNoP3jA0BggrBgEFBQcBAQQoMCYwJAYIKwYB
# BQUHMAGGGGh0dHA6Ly9vY3NwLmdvZGFkZHkuY29tLzA1BgNVHR8ELjAsMCqgKKAm
# hiRodHRwOi8vY3JsLmdvZGFkZHkuY29tL2dkcm9vdC1nMi5jcmwwRgYDVR0gBD8w
# PTA7BgRVHSAAMDMwMQYIKwYBBQUHAgEWJWh0dHBzOi8vY2VydHMuZ29kYWRkeS5j
# b20vcmVwb3NpdG9yeS8wDQYJKoZIhvcNAQELBQADggEBAAh+bJMQyDi4lqmQS/+h
# X08E72w+nIgGyVCPpnP3VzEbvrzkL9v4utNb4LTn5nliDgyi12pjczG19ahIpDsI
# LaJdkNe0fCVPEVYwxLZEnXssneVe5u8MYaq/5Cob7oSeuIN9wUPORKcTcA2RH/TI
# E62DYNnYcqhzJB61rCIOyheJYlhEG6uJJQEAD83EG2LbUbTTD1Eqm/S8c/x2zjak
# zdnYLOqum/UqspDRTXUYij+KQZAjfVtL/qQDWJtGssNgYIP4fVBBzsKhkMO77wIv
# 0hVU7kQV2Qqup4oz7bEtdjYm3ATrn/dhHxXch2/uRpYoraEmfQoJpy4Eo428+LwE
# MAEwggTmMIIDzqADAgECAhBiXE2QjNVC+6supXM/8VQZMA0GCSqGSIb3DQEBBQUA
# MIGVMQswCQYDVQQGEwJVUzELMAkGA1UECBMCVVQxFzAVBgNVBAcTDlNhbHQgTGFr
# ZSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxITAfBgNVBAsT
# GGh0dHA6Ly93d3cudXNlcnRydXN0LmNvbTEdMBsGA1UEAxMUVVROLVVTRVJGaXJz
# dC1PYmplY3QwHhcNMTEwNDI3MDAwMDAwWhcNMjAwNTMwMTA0ODM4WjB6MQswCQYD
# VQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdT
# YWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDEgMB4GA1UEAxMXQ09N
# T0RPIFRpbWUgU3RhbXBpbmcgQ0EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK
# AoIBAQCqgvGEqVvYcbXSXSvt9BMgDPmb6dGPdF5u7uspSNjIvizrCmFgzL2SjXzd
# dLsKnmhOqnUkcyeuN/MagqVtuMgJRkx+oYPp4gNgpCEQJ0CaWeFtrz6CryFpWW1j
# zM6x9haaeYOXOh0Mr8l90U7Yw0ahpZiqYM5V1BIR8zsLbMaIupUu76BGRTl8rOnj
# rehXl1/++8IJjf6OmqU/WUb8xy1dhIfwb1gmw/BC/FXeZb5nOGOzEbGhJe2pm75I
# 30x3wKoZC7b9So8seVWx/llaWm1VixxD9rFVcimJTUA/vn9JAV08m1wI+8ridRUF
# k50IYv+6Dduq+LW/EDLKcuoIJs0ZAgMBAAGjggFKMIIBRjAfBgNVHSMEGDAWgBTa
# 7WR0FJwUPKvdmam9WyhNizzJ2DAdBgNVHQ4EFgQUZCKGtkqJyQQP0ARYkiuzbj0e
# J2wwDgYDVR0PAQH/BAQDAgEGMBIGA1UdEwEB/wQIMAYBAf8CAQAwEwYDVR0lBAww
# CgYIKwYBBQUHAwgwEQYDVR0gBAowCDAGBgRVHSAAMEIGA1UdHwQ7MDkwN6A1oDOG
# MWh0dHA6Ly9jcmwudXNlcnRydXN0LmNvbS9VVE4tVVNFUkZpcnN0LU9iamVjdC5j
# cmwwdAYIKwYBBQUHAQEEaDBmMD0GCCsGAQUFBzAChjFodHRwOi8vY3J0LnVzZXJ0
# cnVzdC5jb20vVVROQWRkVHJ1c3RPYmplY3RfQ0EuY3J0MCUGCCsGAQUFBzABhhlo
# dHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0GCSqGSIb3DQEBBQUAA4IBAQARyT3h
# Beg7ZazJdDEDt9qDOMaSuv3N+Ntjm30ekKSYyNlYaDS18AshU55ZRv1jhd/+R6pw
# 5D9eCJUoXxTx/SKucOS38bC2Vp+xZ7hog16oYNuYOfbcSV4Tp5BnS+Nu5+vwQ8fQ
# L33/llqnA9abVKAj06XCoI75T9GyBiH+IV0njKCv2bBS7vzI7bec8ckmONalMu1I
# l5RePeA9NbSwyVivx1j/YnQWkmRB2sqo64sDvcFOrh+RMrjhJDt77RRoCYaWKMk7
# yWwowiVp9UphreAn+FOndRWwUTGw8UH/PlomHmB+4uNqOZrE6u4/5rITP1UDBE0L
# kHLU6/u8h5BRsjgZMIIE/jCCA+agAwIBAgIQK3PbdGMRTFpbMkryMFdySTANBgkq
# hkiG9w0BAQUFADB6MQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5j
# aGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGlt
# aXRlZDEgMB4GA1UEAxMXQ09NT0RPIFRpbWUgU3RhbXBpbmcgQ0EwHhcNMTkwNTAy
# MDAwMDAwWhcNMjAwNTMwMTA0ODM4WjCBgzELMAkGA1UEBhMCR0IxGzAZBgNVBAgM
# EkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBwwHU2FsZm9yZDEYMBYGA1UECgwP
# U2VjdGlnbyBMaW1pdGVkMSswKQYDVQQDDCJTZWN0aWdvIFNIQS0xIFRpbWUgU3Rh
# bXBpbmcgU2lnbmVyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAv1I2
# gjrcdDcNeNV/FlAZZu26GpnRYziaDGayQNungFC/aS42LwpnP0ChSopjNZvQGcx0
# qhcZkSu1VSAZ+8AaOm3KOZuC8rqVoRrYNMe4iXtwiHBRZmnsd/7GlHJ6zyWB7TSC
# mt8IFTcxtG2uHL8Y1Q3P/rXhxPuxR3Hp+u5jkezx7M5ZBBF8rgtgU+oq874vAg/Q
# TF0xEy8eaQ+Fm0WWwo0Si2euH69pqwaWgQDfkXyVHOaeGWTfdshgRC9J449/YGpF
# ORNEIaW6+5H6QUDtTQK0S3/f4uA9uKrzGthBg49/M+1BBuJ9nj9ThI0o2t12xr33
# jh44zcDLYCQD3npMqwIDAQABo4IBdDCCAXAwHwYDVR0jBBgwFoAUZCKGtkqJyQQP
# 0ARYkiuzbj0eJ2wwHQYDVR0OBBYEFK7u2WC6XvUsARL9jo2yVXI1Rm/xMA4GA1Ud
# DwEB/wQEAwIGwDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMI
# MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQMIMCUwIwYIKwYBBQUHAgEWF2h0dHBz
# Oi8vc2VjdGlnby5jb20vQ1BTMEIGA1UdHwQ7MDkwN6A1oDOGMWh0dHA6Ly9jcmwu
# c2VjdGlnby5jb20vQ09NT0RPVGltZVN0YW1waW5nQ0FfMi5jcmwwcgYIKwYBBQUH
# AQEEZjBkMD0GCCsGAQUFBzAChjFodHRwOi8vY3J0LnNlY3RpZ28uY29tL0NPTU9E
# T1RpbWVTdGFtcGluZ0NBXzIuY3J0MCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5z
# ZWN0aWdvLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAen+pStKwpBwdDZ0tXMauWt2P
# RR3wnlyQ9l6scP7T2c3kGaQKQ3VgaoOkw5mEIDG61v5MzxP4EPdUCX7q3NIuedcH
# TFS3tcmdsvDyHiQU0JzHyGeqC2K3tPEG5OfkIUsZMpk0uRlhdwozkGdswIhKkvWh
# QwHzrqJvyZW9ljj3g/etfCgf8zjfjiHIcWhTLcuuquIwF4MiKRi14YyJ6274fji7
# kE+5Xwc0EmuX1eY7kb4AFyFu4m38UnnvgSW6zxPQ+90rzYG2V4lO8N3zC0o0yoX/
# CLmWX+sRE+DhxQOtVxzhXZIGvhvIPD+lIJ9p0GnBxcLJPufFcvfqG5bilK+GLjCC
# Bi8wggUXoAMCAQICCQDO3DIHCD79+TANBgkqhkiG9w0BAQsFADCBtDELMAkGA1UE
# BhMCVVMxEDAOBgNVBAgTB0FyaXpvbmExEzARBgNVBAcTClNjb3R0c2RhbGUxGjAY
# BgNVBAoTEUdvRGFkZHkuY29tLCBJbmMuMS0wKwYDVQQLEyRodHRwOi8vY2VydHMu
# Z29kYWRkeS5jb20vcmVwb3NpdG9yeS8xMzAxBgNVBAMTKkdvIERhZGR5IFNlY3Vy
# ZSBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgLSBHMjAeFw0xODA3MTYxMjEwMjRaFw0y
# MTEwMTMxMTM0MDRaMHAxCzAJBgNVBAYTAlVTMREwDwYDVQQIEwhWaXJnaW5pYTES
# MBAGA1UEBxMJQXJsaW5ndG9uMRwwGgYDVQQKExNFWFBFUlQgQ0hPSUNFLCBJTkMu
# MRwwGgYDVQQDExNFWFBFUlQgQ0hPSUNFLCBJTkMuMIICIjANBgkqhkiG9w0BAQEF
# AAOCAg8AMIICCgKCAgEAtB90PYUEUzgap0+NY5q/0PCFKJZQ46OY90GITgtDH+Dy
# 4sYbfhrV8898oJpAHIM2G9k7q1Bb2c9shdAKgnGZ1pg5juRHjDusocaruWkDYpLj
# QG33kWglXEgU4bzvVdr92pQ3hkqAxc32nCAk1lxeBidrhB5Id87eblTcHaB+IukT
# Cvt2KdcNO9+C57C3vmTm8P94bXiBpXlGqeLxfJZV0KbcC95SDJAEzYh4/G+hJy+e
# rWNsGDpdAQfTIR7re+6Exl/9srvj/94XK5IQVAmOVd6HwXSjELHtwhO9Px7HT49T
# oR4ql8xdsikTvksEN6gPF404y35rAxYi+olj/eKyKzCvq4gbEdISmrXgTd1M/emX
# khvMzEp+jR9Q1u72FyCsE0UXu+Oyq4UuUtHsRAD7dO2ZvU8T+SAD/ToE/j3W0pyU
# B1IYN26zyVO0gtYuly3ogSxjtUCwQ9HtkMKP/fRQ56uPHvqd2+P8ZIcrd2P+tiAv
# xnKOmmO0bQb0HTYcCDztzUXiMqSPIVKzi/t0yq5zSXFxKh0d+Su/IMD8cnah5L1O
# boZUstjc+BM627YTU6b7IDAToUmiTTgM8ZOh8ZPhe59MYpZua3kOle1Ik0jsgehn
# pxoj9qO5SG0yXF8/37THyseI0C/R92UIz5RI+Wj/s09z2DxC+08B3wjRAXHTALUC
# AwEAAaOCAYUwggGBMAwGA1UdEwEB/wQCMAAwEwYDVR0lBAwwCgYIKwYBBQUHAwMw
# DgYDVR0PAQH/BAQDAgeAMDUGA1UdHwQuMCwwKqAooCaGJGh0dHA6Ly9jcmwuZ29k
# YWRkeS5jb20vZ2RpZzJzNS00LmNybDBdBgNVHSAEVjBUMEgGC2CGSAGG/W0BBxcC
# MDkwNwYIKwYBBQUHAgEWK2h0dHA6Ly9jZXJ0aWZpY2F0ZXMuZ29kYWRkeS5jb20v
# cmVwb3NpdG9yeS8wCAYGZ4EMAQQBMHYGCCsGAQUFBwEBBGowaDAkBggrBgEFBQcw
# AYYYaHR0cDovL29jc3AuZ29kYWRkeS5jb20vMEAGCCsGAQUFBzAChjRodHRwOi8v
# Y2VydGlmaWNhdGVzLmdvZGFkZHkuY29tL3JlcG9zaXRvcnkvZ2RpZzIuY3J0MB8G
# A1UdIwQYMBaAFEDCvSeOzDSDMKIz1/tss/C0LIDOMB0GA1UdDgQWBBTcXViurnVD
# WHP94MuRSFgwWfACBDANBgkqhkiG9w0BAQsFAAOCAQEAAtSIeiTqQfndxyofMi/w
# TdZ37aP45d4lJXzJf8bsEs5WtI4wS1QeTgJwY6Ax1tQitc+hGirDFU/tdqPADWCA
# 5qf0cJF0tDBnVJgBw5uO6IKOZZhgbuiJSQWDIqTmh/wEIMoO22Sy2g/wPVXw6+p3
# WbmT4qSyuu8ZgXxs/zHZBJTRAWGZale6PMPfb7HPcTF+QRfMzTfwU7tr3V8xpSbO
# hAycKHFi9hE/Tsa0Yw8Lz013fD1LtIgRIhAL7keGI1KXzYVVeyUpi9G/SMTnN4Lc
# sIMz465p1C26AFS7L5aMeZPiAVzi2DF6pY84aZ3+/9Xgc5PcELkUcKQb03G8P7DV
# ODGCBZAwggWMAgEBMIHCMIG0MQswCQYDVQQGEwJVUzEQMA4GA1UECBMHQXJpem9u
# YTETMBEGA1UEBxMKU2NvdHRzZGFsZTEaMBgGA1UEChMRR29EYWRkeS5jb20sIElu
# Yy4xLTArBgNVBAsTJGh0dHA6Ly9jZXJ0cy5nb2RhZGR5LmNvbS9yZXBvc2l0b3J5
# LzEzMDEGA1UEAxMqR28gRGFkZHkgU2VjdXJlIENlcnRpZmljYXRlIEF1dGhvcml0
# eSAtIEcyAgkAztwyBwg+/fkwCQYFKw4DAhoFAKB4MBgGCisGAQQBgjcCAQwxCjAI
# oAKAAKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIB
# CzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFKksdagXTA7iJYVl0ZiA
# ux4nL8SMMA0GCSqGSIb3DQEBAQUABIICAB7s0eMI3td5cbWWw/NHAGysfWpkmvBD
# LkJT4u+FWpcLasR8Jw0VoFXGHkoYawB8kqAUspKvVbsWNmAU4HYQ4GOyfSh48JSu
# k9qH9SYIMWsoBZbpJS42GahoZ81gXjyaZQWPz6wbnFFlZC8WdyWooM0qff3IJkhj
# QYt1bFNLhoUBIC2EulY9hki3Xl6Z98ep6nXvuYChCHeA1L/2bIo+4QsMJgi8dc7n
# rO4dbxCaqn2SucdMwyu+p9e5lSeZNDtwZ4wotiH0ctjzF1+ZBNtHhEJtcE6YyPCP
# PnVUOK70DHgzyl31y9Yi/YDLIFEXcm5U1H/rLyv6mGZLmmG83M0aca/LbxUXzI6C
# 7W6imqUQq9zL+/GeGMFo1Oo/wQAvGbSKH7glhJW+wVRYuL3PvLUjiIG0GFOEYg/r
# /9N3v8kg/eXk9h/T+4MKB3N7c5Jz6Ad4jyOFGS2wkLHHcxgYcwB7p1kFz2RByWTL
# jsUpjXGsetpkKyKMGl7IovS/ieDMvU3orwAXVlgOE4TYbK8Wv82VUYUqAZr3y1ls
# GJa+qiBiOzurFM8sBY8w8wu9S1Bm92cGgjcWEMxwscrTo4bRD8kLNEO7DkFPF489
# CbLf8j/BTr5AW8mtj0eq5bi5N20/Su92+s31cim2rCrsILMK0f+jYtEhMtJ3Dt4i
# ArPD/yw0HJ7AoYICKDCCAiQGCSqGSIb3DQEJBjGCAhUwggIRAgEBMIGOMHoxCzAJ
# BgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcT
# B1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMSAwHgYDVQQDExdD
# T01PRE8gVGltZSBTdGFtcGluZyBDQQIQK3PbdGMRTFpbMkryMFdySTAJBgUrDgMC
# GgUAoF0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcN
# MTkxMjE0MTk0MTA3WjAjBgkqhkiG9w0BCQQxFgQUNEmpcVTCDJA9vdixnGBrKLwm
# ca8wDQYJKoZIhvcNAQEBBQAEggEAOrsrDkMkwsgJQzxQnjx4vYVhJBxbxsYn9Ej9
# vS1ghJJW/KhsSFx0VhlE83WhKtw8Yps1jFvZ4IbylsVDYk8Jy1QZ9Ctlfl9CcIfG
# IOXvD9lgHz1LFeAYy+ImSRSeBAbk68wP/521mUlDpWwuUBZqsg/MwAzP+adPFi6r
# glZtP6d7lC3NI50vdtJuqEMFeUoPl6BbNXn6ZO+rTywkIh0YEzxzUwN/EcKiS/Yh
# cM9+f/7LMwi1Ag7tcDDBcs3uUMOovlpFLdqPbcXfVHPcjK6lNb0dK+auvpapAo5x
# uCoq/Imvg6mq/OQsudosTw43K/mVOUKu2OQVzDnPQ9zt/TeNFA==
# SIG # End signature block
