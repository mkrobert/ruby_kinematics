      #if (t == nil)
      #  t = findT(vI, vF, a, d, t)
      #end

include Math

class Kinematics

  def findVI (vI, vF, a, d, t)
    if (vI != nil)
      return vI
    elsif (vF == nil)
      return (-0.5 * a * (t ** 2)) / t
    elsif (a == nil)
      return (2 * d / t) - vF 
    elsif (d == nil)
      return vF - (a * t)
    elsif (t == nil)
      return sqrt((vF ** 2) - (2 * a * d))
    else
      return "unexpected findVI result"
    end
  end

  def findVF (vI, vF, a, d, t)
    if (vF != nil)
      return vF    
    elsif (vI == nil)
      return findVI(vI, vF, a, d, t) + (a * t)
    elsif (a == nil)
      return (2 * d / t) - vI
    elsif (d == nil)
      return vI + (a * t)
    elsif (t == nil)
      return sqrt((vI ** 2) + (2 * a * d))
    else
      return "unexpected findVF result"
    end 
  end

  def findA (vI, vF, a, d, t)
    if (a != nil)
      return a
    elsif (vI == nil)
     return (vF - findVI(vI, vF, a, d, t)) / t
    elsif (vF == nil)
      return (2 * d / (t ** 2)) - (2 * vI / t)
    elsif (d == nil)
      return (vF - vI) / t
    elsif (t == nil)
      return ((vF ** 2) - (vI ** 2)) / (2 * d)
    else
      return "unexpected findA result"
    end
  end

  def findD (vI, vF, a, d, t)
    if (d != nil)
      return d
    elsif (vI == nil)
      return ((vF + findVI(vI, vF, a, d, t))/2 * t)
    elsif (vF == nil)
      return (vI * t) + (0.5 * a * (t ** 2))  
    elsif (a == nil)
      return (vF + vI) / 2 * t
    elsif (t == nil)
      return ((vF ** 2) - (vI ** 2)) / (2 * a)
    else
      return "unexpected findD result"
    end
  end

  def findT (vI, vF, a, d, t)
    if (t != nil)
      return t
    elsif (vI == nil)
      return (vF - findVI(vI, vF, a, d, t)) / a
    elsif (vF == nil)
      testQPlus = ((-1 * vI) + sqrt((vI ** 2) - (4 * (0.5 * a) * (-1 * d)))) / (2 / 2 * a)
      if (testQPlus >= 0)
        return testQPlus
      else
        return ((-1 * vI) - sqrt((vI ** 2) - (4 * (0.5 * a) * (-1 * d)))) / (2 / 2 * a)
      end
    elsif (a == nil)
      return (2 * d) / (vI + vF)
    elsif (d == nil)
      return (vF / a) - (vI / a) 
    else
      return "unexpected findT result"
    end
  end

  def findAll (vI, vF, a, d, t)
    return [findVI(vI, vF, a, d, t),
            findVF(vI, vF, a, d, t),
            findA(vI, vF, a, d, t),
            findD(vI, vF, a, d, t),
            findT(vI, vF, a, d, t)]
  end
end



#kineq = Kinematics.new
#puts kineq.findAll(0,nil,-9.8,-27,nil).to_s
