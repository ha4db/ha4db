GRAPHVIS = dot

%.png : %.dot
	$(GRAPHVIS) -Tpng -o $@ $<

.PHONY: all
all: $(patsubst %.dot,%.png,$(wildcard *.dot))

.PHONY: clean
clean:
	rm -f *.png