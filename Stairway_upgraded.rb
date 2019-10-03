def dice(click)
    if click 
        puts "Clique sur entrer pour lancer les dés!"
        answer = gets.chomp
    end
    d = Random.new.rand(1..6) 
    if click 
        puts "lancer de dé : #{d}"
    end 
    return d 
end 

def up(p, click)
    p = p+1
    if click
        puts "tu es monté d'une marche, tu es maintenant à la marche #{p}"
    end
    return p
end

def down(p, click)
    if p == 0
        p = 0
        if click
            puts "vous restez sur la marche 0"
        end
    else
        p = p-1
        if click 
            puts "tu es descendu d'une marche, tu es maintenant à la marche #{p}"
        end
    end
    return p
end


def perform (click)
    p = 1 
    count = 0
    while p < 10
        d = dice(click)
        if d.between?(2,4)
            if click 
                puts "no move"
            end 
        elsif d.between?(5,6)
            p = up(p, click)
        else 
            p = down(p, click)
        end 
        count += 1
    end
    if click
        puts "Bravo ! tu as monté l'escalier en #{count} coups"
    end
    return count
end

def average_finish_time (sample)
    score = []
    sample.to_i.times do 
        count = perform (false)
        score << count 
    end 
    puts "Scores des parties : \n #{score}"
    mean = score.sum(0.0) / score.length
    puts "\nEn moyenne il a fallu sur  #{sample} parties #{mean} coups pour monter 10 marches\n"
end

def admin_control
    puts "what do you want to do ? [play/stats]"
    target = gets.chomp 
    if target == "play" 
        perform (true)
    elsif target == "stats"
        puts "ok mais sur un échantillon de combien ?"
        sample = gets.chomp
        average_finish_time(sample)
    else puts "j'ai pas compris :("
    end 
end

admin_control