(def plateau '(5 5))
(def rovers '(
    (1 2 \N "LMLMLMLMM")
    (3 3 \E "MMRMMRMRRM")))

(defn in-plateau [[max-x max-y] [x y _]]
    (and (<= 0 x max-x) (<= 0 y max-y)))

(defn move [x y heading]
    (let [deltas {\N '(0 1)
                  \S '(0 -1)
                  \W '(-1 0)
                  \E '(1 0)}
          delta (deltas heading)
          [dx dy] delta]
        (list (+ x dx) (+ y dy) heading)))

(defn rotate [x y heading way]
    (let [headings '(\N \E \S \W)]
        (assert (some #{heading} headings))
        (let [new-heading (nth (drop-while #(not= %1 heading) (cycle headings)) 
                               (way (count headings)))]
            (list x y new-heading))))

(defn right [x y heading]
    (rotate x y heading inc))

(defn left [x y heading]
    (rotate x y heading dec))

(defn how [command]
    (let [commands {\M move 
                    \R right 
                    \L left}]
        (commands command)))

(defn step [[x y heading] command in-our-plateau]
    (let [new-rover ((how command) x y heading)]
        (assert (in-our-plateau new-rover))
        new-rover))

(defn execute [[x y heading commands] in-our-plateau]
    (reduce #(step %1 %2 in-our-plateau) (list x y heading) (seq commands)))

(defn rove [rovers in-our-plateau]
    (map execute rovers (cycle (list in-our-plateau))))

(print (rove rovers #(in-plateau plateau %1)))

