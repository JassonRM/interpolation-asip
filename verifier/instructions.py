def sll(r1, r2):
    r3 = r1
    for x in range(r2):
        r3 = r3 // 2
    return r3


def sub(r1, r2):
    return r1 - r2


def add(r1, r2):
    return r1 + r2


def mult(r1, r2):
    return r1 * r2


def vldb(img, vr1):
    return img[vr1:vr1 + 4]  # READ 2 bytes


def vmni1(vr1):
    return [vr1[0], vr1[0], vr1[1], vr1[1]]  # Bit extension


def vmni2(vr1):
    return [vr1[2], vr1[2], vr1[3], vr1[3]]  # Bit extension


def vstb(output_img, vr1, vr2):  # Must be able to store misaligned vectors
    output_img[vr2:vr2 + 4] = vr1


def vbiv(vr1, vr2):
    return [(vr1[0] * 2 / 3 + vr2[0] / 3) // 1, (vr1[1] * 2 / 3 + vr2[1] / 3) // 1,
            (vr1[2] * 2 / 3 + vr2[2] / 3) // 1, (vr1[3] * 2 / 3 + vr2[3] / 3) // 1]


def vbih1(vr1):
    return [vr1[0], (vr1[0] * 2 / 3 + vr1[1] / 3) // 1, (vr1[1] * 2 / 3 + vr1[0] / 3) // 1, vr1[1]]


def vbih2(vr1):
    return [(vr1[1] * 2 / 3 + vr1[2] / 3) // 1, (vr1[2] * 2 / 3 + vr1[1] / 3) // 1, vr1[2],
            (vr1[2] * 2 / 3 + vr1[3] / 3) // 1]


def vbih3(vr1, vr2):
    return [(vr1[3] * 2 / 3 + vr1[2] / 3) // 1, vr1[3], (vr1[3] * 2 / 3 + vr2[0] / 3) // 1,
            (vr2[0] * 2 / 3 + vr1[3] / 3) // 1]
