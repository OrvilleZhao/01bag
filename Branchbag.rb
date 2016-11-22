class Node
  attr_accessor :parent
  attr_accessor :have
  attr_accessor :left
  attr_accessor :right
  attr_accessor :level
  attr_accessor :code
  def initialize a,b,c,e,f,g
    self.parent=a
    self.have=b
    self.left=c
    self.right=e
    self.level=f
    self.code=g
  end
end
class Thing
  attr_accessor :value
  attr_accessor :volume
  def initialize a,b
    self.value=a
    self.volume=b
  end
end
class Bag
  def initialize value
    @content=value
  end
  def put articles
    list=Array.new
    list.push(Node.new(nil,Thing.new(0,0),nil,nil,0,""))
    max=0
    maxcode=""
    while !list.empty? do
      a=list.pop
      if a.level==articles.length
        next
      end
      if a.have.volume+articles[a.level].volume<@content
        left=Node.new(a,Thing.new(a.have.value+articles[a.level].value,a.have.volume+articles[a.level].volume),nil,nil,a.level+1,a.code+"1")
        a.left=left
        list.push(left)
      else
        if max<a.have.value
          max=a.have.value
          maxcode=a.code
        end
      end
      right=Node.new(a,a.have,nil,nil,a.level+1,a.code+"0")
      a.right=right
      list.push(right)
    end
    return max,maxcode
  end
end
#测试程序
class Main
  test=Array.new
  test<<Thing.new(10,5)
  test<<Thing.new(9,4)
  test<<Thing.new(6,3)
  test<<Thing.new(1,5)
  test<<Thing.new(4,2)
  test<<Thing.new(1,5)
  test<<Thing.new(9,4)
  test<<Thing.new(20,4)
  test<<Thing.new(6,3)
  test<<Thing.new(20,4)
  test<<Thing.new(4,2)
  test<<Thing.new(10,5)
  test<<Thing.new(6,2)
  test<<Thing.new(3,2)
  test<<Thing.new(5,6)
  test<<Thing.new(4,5)
  k=Bag.new(10)
  puts k.put(test)
end