package bytedance2;


import java.util.*;

public class majang {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ArrayList<Integer> in = new ArrayList<Integer>();
        for (int i = 0; i < 13; i++) {
            in.add(sc.nextInt());
        }


        ArrayList<Integer> result = new ArrayList<Integer>();
        for (int i = 1; i <= 9; i++) {
            if (panduan(in, i)) {
                result.add(i);
            }
        }
        for (int resultItem : result) {
            System.out.println(resultItem);
            System.out.println(" ");
        }


    }


    public static boolean panduan(List<Integer> pais, int Id) {

        pais.add(Id);

        Collections.sort(pais);


//     for  ( int  i = 0; i < pais.size(); i++)
//     {
        ArrayList<Integer> paiT = new ArrayList<Integer>(pais);

        HashMap<Integer, Integer> ds = new HashMap<>();

        for (int temp : pais) {
            ds.put(temp, ds.getOrDefault(temp, 0) + 1);
        }

        for (int temp : ds.keySet()) {
            if (ds.get(temp) >= 2) {
                paiT.remove(temp);
                paiT.remove(temp);
                if (HuPaiPanDin(paiT)) {
                    return true;
                }
            }
        }
//        if (ds.get(pais.get(i)) >= 2) {
//               paiT.remove(pais.get(i));
//               paiT.remove(pais.get(i));
//
//
//               i += ds.get(pais.get(i));
//
//               if (HuPaiPanDin(paiT)) {
//                   return true;
//               }
//        }

//    }
            return false;
        }

        public static boolean HuPaiPanDin (ArrayList < Integer > mahs)
        {
            if (mahs.size() == 0) {
                return true;
            }

            HashMap<Integer, Integer> fs = new HashMap<>();

            for (int temp : mahs) {
                fs.put(temp, fs.getOrDefault(temp, 0) + 1);
            }


            for (int temp : fs.keySet()) {
                if (fs.get(temp) == 3&&mahs.size()>=3) {

                    mahs.remove(temp);
                    mahs.remove(temp);
                    mahs.remove(temp);

                    return HuPaiPanDin(mahs);

                } else {
                    if (mahs.contains(temp + 1) && mahs.contains(temp + 2)&&mahs.size()>=3) {
                        mahs.remove(temp);
                        mahs.remove(temp + 1);
                        mahs.remove(temp + 2);

                        return HuPaiPanDin(mahs);
                    }

                }

            }
            return false;
        }
    }

