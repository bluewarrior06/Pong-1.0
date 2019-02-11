require("collide")


function love.load()
    win=false
    math.randomseed(os.time())
    p={}
    p.x=300
    p.y=400
    p.w=300
    p.h=30
    p.speed=5
    p.draw=love.graphics
    p.score = 0

    b={}
    b.x=300
    b.y=400
    b.w=20
    b.h=20
    b.dirx=10
    b.diry=10
    b.speed=3
    b.draw=love.graphics
    b.randomloc=math.random(1, 2)

    sb={}
    sb.x=100
    sb.y=200
    sb.w=50
    sb.h=20

    sb1={}
    sb1.x=200
    sb1.y=200
    sb1.w=200
    sb1.h=20

    sb2={}
    sb2.x=400
    sb2.y=200
    sb2.w=50
    sb2.h=20

    sb3={}
    sb3.x=500
    sb3.y=200
    sb3.w=50
    sb3.h=20

    sb4={}
    sb4.x=600
    sb4.y=200
    sb4.w=50
    sb4.h=20


    sb.draw=love.graphics

end

function love.update()


    b.x=b.x+b.dirx
    b.y=b.y+b.diry


    if love.keyboard.isDown("left") then
        p.x = p.x - p.speed
      end
    if love.keyboard.isDown("right") then
        p.x = p.x + p.speed
    end

    if CheckCollision(p.x, p.y, p.w, p.h, b.x, b.y, b.w, b.h) then
        b.randomloc=math.random(1, 2)
            if b.randomloc == 1 then
                b.dirx = 5
            end
            if b.randomloc == 2 then
                b.dirx = -5
            end
        b.diry= -5
    end


        if b.x <= 0 then
            b.dirx = 5
        end
        if b.y <= 0 then
            b.diry=5
        end
        if b.x >= 800 then
            b.dirx =-5
        end
end

function love.draw()

    b.draw.rectangle("fill", b.x, b.y, b.w, b.h)
    b.draw.setColor(255, 255, 255)
    p.draw.rectangle("fill", p.x, p.y, p.w, p.h)
    p.draw.setColor(255, 255,255)
    love.graphics.rectangle("fill", sb.x, sb.y, sb.w, sb.h)
    love.graphics.rectangle("fill", sb1.x, sb1.y, sb1.w, sb1.h)
    love.graphics.rectangle("fill", sb2.x, sb2.y, sb2.w, sb2.h)
    love.graphics.rectangle("fill", sb3.x, sb3.y, sb3.w, sb3.h)
    love.graphics.rectangle("fill", sb4.x, sb4.y, sb4.w, sb4.h)

    if CheckCollision(b.x, b.y, b.w, b.h, sb.x, sb.y, sb.w, sb.h) then
        p.score=p.score+1
        sb.x=9999
    end
    if CheckCollision(b.x, b.y, b.w, b.h, sb1.x, sb1.y, sb1.w, sb1.h) then
        p.score=p.score+1
        sb1.x=9999
    end
    if CheckCollision(b.x, b.y, b.w, b.h, sb2.x, sb2.y, sb2.w, sb2.h) then
        p.score=p.score+1
        sb2.x=9999
    end
    if CheckCollision(b.x, b.y, b.w, b.h, sb3.x, sb3.y, sb3.w, sb3.h) then
        p.score=p.score+1
        sb3.x=9999
    end
    if CheckCollision(b.x, b.y, b.w, b.h, sb4.x, sb4.y, sb4.w, sb4.h) then
        p.score=p.score+1
        sb4.x=9999
    end

    if win == false then

        if b.y >= 600 then
                love.graphics.clear()
                love.graphics.print("YOU FAILED...", 40, 100, 0, 10)
                p.score="X"
        end
    end

    if p.score == 5 then
        win=true
        love.graphics.print("You Win!", 40, 100, 0, 10)
    end
    love.graphics.print("Score:", 0, 100)
    love.graphics.print(p.score, 40, 100)


end
