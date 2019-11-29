/**
 * @ClassNameFindMediumSortedArrays
 * @Author jianwen
 * @Date 19-10-10 下午9:50
 * @Version V1.0
 */
public class FindMediumSortedArrays {
    public double find(int[]nums1,int[]nums2){
        int m= nums1.length;
        int n=nums2.length;
        int l=(m+n+1)/2;
        int r=(m+n+2)/2;
        return((getKth(nums1,0,nums2,0,l)+getKth(nums1,0,nums2,0,r)))/2;
    }

    // 在两个有序数组中二分查找第k 大的元素
    public int getKth(int[] nums1,int start1,int[] nums2,int start2,int k){
        if(start1>nums1.length-1) return nums2[start2+k-1];
        if(start2>nums2.length-1) return nums1[start1+k-1];

        if(k==1) return Math.min(nums1[start1],nums2[start2]);

        int nums1Mid=start1+k/2-1<nums1.length?nums1[start1+k/2-1]:Integer.MAX_VALUE;
        int nums2Mid=start2+k/2-1<nums2.length?nums2[start2+k/2-1]:Integer.MAX_VALUE;

        if(nums1Mid<nums2Mid){
            return getKth(nums1, start1+k/2, nums2, start2, k-k/2);
        }else{
            return getKth(nums1,start1,nums2,start2+k/2,k-k/2);
        }
     }
}
