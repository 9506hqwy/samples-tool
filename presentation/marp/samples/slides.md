---
marp: true
theme: default
style: |
  /* https://github.com/marp-team/marp-core/blob/main/themes/default.scss */
  section {
    background-color: white;
    font-size: 20px;
    justify-content: start;
  }
  section.lead {
    justify-content: center;
  }
  h1 {
    font-size: 48px;
  }
  h2 {
    font-size: 36px;
    border-bottom: solid;
  }
  h3 {
    border-bottom: solid;
  }
  pre {
    font-size: 10px;
  }
  .footnote {
    font-size: 15px;
    position: absolute;
    bottom: 30px;
  }
size: 16:9
paginate: true
---
<!-- _class: lead -->
<!-- _paginate: false -->

# タイトル

#### サブタイトル

---

## セクション

セクションの文章を書く。

### サブセクション

サブセクションの文章を書く。

<div class="footnote">
フッター
</div>

---

## 箇条書きと画像

順序なし箇条書き

- アイテム1
- アイテム2
- アイテム3

順序あり箇条書き

1. アイテム1
1. アイテム2
1. アイテム3

![bg right:50% 100%](images/mark_koujichu.png)

---

## コードブロック

### Python

```python
def func(i: int) -> int:
  return i
```

### yaml

```yaml
object:
  key: value
  array: [
    1,
    2,
    3,
  ]
```
